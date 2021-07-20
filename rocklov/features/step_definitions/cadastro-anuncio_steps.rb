Dado('que estou logado como {string} e {string}') do |email, password|
    visit "/"
    find("#email").set email
    find("#password").set password
    click_button "Entrar"
end
  
Dado('que acesso o formulario de cadastro de anuncios') do
    click_button "Criar anúncio"
    expect(page).to have_css "#equipoForm"
end
  
Dado('que eu tenho o seguinte equipameto:') do |table|
    @anuncio = table.rows_hash
end 

Quando('submeto o cadastro desse item') do
    thumb = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:thumb]
    find("#thumbnail input[type=file]", visible: false).set thumb

    find("#name").set @anuncio[:nome]
    find("#category").find('option', text: @anuncio[:categoria]).select_option
    find("#price").set @anuncio[:preco]
    #click_button "Cadastrar"
    sleep 10
end
  
Entao('devo ver esse item no meu Dashboard') do
    pending # Write code here that turns the phrase above into concrete actions
end