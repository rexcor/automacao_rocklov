Dado('que estou logado como {string} e {string}') do |email, password|
    #variavel email criada para utilizacao no metodo de exclusao de anuncio
    @email = email
    @login_page.open
    @login_page.with(email, password)
end
  
Dado('que acesso o formulario de cadastro de anuncios') do
    @dash_page.goto_equipo_form
end
  
Dado('que eu tenho o seguinte equipameto:') do |table|
    @anuncio = table.rows_hash
    MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end 

Quando('submeto o cadastro desse item') do
    @equipos_page.create(@anuncio)
end
  
Entao('devo ver esse item no meu Dashboard') do
    expect(@dash_page.equipo_list).to have_content @anuncio[:nome]
    expect(@dash_page.equipo_list).to have_content "R$#{@anuncio[:preco]}/dia"
    expect(@dash_page.equipo_list).to have_xpath "//*[contains(@style,'background-image')]"
end