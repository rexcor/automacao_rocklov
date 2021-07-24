Dado('que acesso a página principal') do
    login_page = LoginPage.new
    login_page.abrir
end
  
Quando('submeto minhas credenciais válidas com {string} e {string}') do |email, password|
    login_page = LoginPage.new
    login_page.campo_email.set email
    login_page.campo_senha.set password
    login_page.botao_entrar
end

#Passo do então está compartilhado do arquivo shared_steps.rb