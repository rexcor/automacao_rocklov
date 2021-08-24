Dado('Login com {string} e {string}') do |email, password|
    #variavel email criada para utilizacao no metodo de exclusao de anuncio
    @email = email
    @login_page.open
    @login_page.with(email, password)

    #checkpoint para garantir que estamos no dashboard
    expect(@dash_page.on_dash?).to be true
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

Entao('deve conter a mensagem de alerta: {string}') do |expect_alert|
    expect(@alert.dark).to have_text expect_alert
end

######################### Remover anuncios #########################

Dado('que eu tenho um anuncio indesejado') do |table|
    user_id = page.execute_script("return localStorage.getItem('user')")
    log user_id

    thumbnail = File.open(File.join(Dir.pwd, "features/support/fixtures/images", table.rows_hash[:thumb]))

    @equipo = {
        thumbnail: thumbnail,
        name: table.rows_hash[:nome],
        category: table.rows_hash[:categoria],
        price: table.rows_hash[:preco],
    }

    EquiposServices.new.create(@equipo, user_id)
    visit current_path
end
  
Quando('eu apago esse anuncio') do
    @dash_page.request_removal(@equipo[:name])
end
  
Quando('confirmo a exclusao') do
    @dash_page.confirm_removal
end
  
Entao('nao devo ver esse item no meu dashboard') do
    expect(@dash_page.has_no_equipo?(@equipo[:name])).to be true
end