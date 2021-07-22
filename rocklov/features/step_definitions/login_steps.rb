Dado('que acesso a página principal') do
    visit "/"
end
  
Quando('submeto minhas credenciais válidas com {string} e {string}') do |email, password|
    find("input[placeholder='Seu email']").set email #css selector para busca do placeholder, manter entre aspas simples caso nome seja composto
    find("input[type=password]").set password #css selector para busca do type
    click_button "Entrar"
end

#Passo do então está compartilhado do arquivo shared_steps.rb