Dado('que acesso a página principal') do
    login_page = LoginPage.new
    login_page.open
end
  
Quando('submeto minhas credenciais válidas com {string} e {string}') do |email, password|
    login_page = LoginPage.new
    login_page.with(email, password)
end

#Passo do então está compartilhado do arquivo shared_steps.rb