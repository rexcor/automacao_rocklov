Dado('que estou logado como {string} e {string}') do |email, password|
    #variavel email criada para utilizacao no metodo de exclusao de anuncio
    @email = email
    visit "/"
    find("#user_email").set email
    find("#user_password").set password
    click_button "Entrar"
end
  
Dado('que acesso o formulario de cadastro de anuncios') do
    click_button "Criar anúncio"
    expect(page).to have_css "#equipoForm"
end
  
Dado('que eu tenho o seguinte equipameto:') do |table|
    @anuncio = table.rows_hash
    MongoDB.new.remove_equipo(@anuncio[:nome], @email)
end 

Quando('submeto o cadastro desse item') do
    thumb = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:thumb]
    find("#thumbnail input[type=file]", visible: false).set thumb

    find("#name").set @anuncio[:nome]
    find("#category").find('option', text: @anuncio[:categoria]).select_option
    find("#price").set @anuncio[:preco]
    click_button "Cadastrar"
end
  
Entao('devo ver esse item no meu Dashboard') do
    anuncios = find(".equipo-list")
    expect(anuncios).to have_content @anuncio[:nome]
    expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
    expect(anuncios).to have_xpath "//*[contains(@style,'background-image')]"
end