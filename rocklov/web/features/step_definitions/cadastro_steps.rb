Dado('que acesso a pagina de cadastro') do
    @signup_page.open
end


Quando('submeto o seguinte formulario de cadastro:') do |table|
  user = table.hashes.first
  MongoDB.new.remove_user(user[:email])
  @signup_page.create(user)
end

  
# Quando('efetuo o meu cadastro completo') do
#     MongoDB.new.remove_user("gabriel_teste@gmail.com")
#     find("#fullName").set "Gabriel"
#     find("#email").set "gabriel_teste@gmail.com"
#     find("#password").set "pwd123"
#     click_button "Cadastrar"
# end

# Quando('efetuo o meu cadastro sem o nome') do
#     MongoDB.new.remove_user("gabriel.@gmail.com")
#     find("#email").set "gabriel.@gmail.com"
#     find("#password").set "teste123"
#     click_button "Cadastrar"
#   end
  
# Entao('vejo a mensagem de alerta: Oops. Informe seu nome completo!') do
#     alert = find(".alert-dark")
#     expect(alert.text).to eql "Oops. Informe seu nome completo!"
# end

# Quando('efetuo o meu cadastro sem o email') do
#     find("#fullName").set "Gabriel"
#     find("#password").set "teste123"
#     click_button "Cadastrar"
# end
  
# Entao('vejo a mensagem de alerta: Oops. Informe um email valido!') do
#     alert = find(".alert-dark")
#     expect(alert.text).to eql "Oops. Informe um email válido!"
# end

# Quando('efetuo o meu cadastro com email incorreto') do
#     find("#fullName").set "Gabriel"
#     find("#email").set "teste_gmail.com"
#     find("#password").set "teste123"
#     click_button "Cadastrar"
# end

# Quando('efetuo o meu cadastro sem a senha') do
#     find("#fullName").set "Gabriel"
#     find("#email").set Faker::Internet.free_email
#     click_button "Cadastrar"
#   end
  
#   Entao('vejo a mensagem de alerta: Oops. Informe sua senha secreta!') do
#     alert = find(".alert-dark")
#     expect(alert.text).to eql "Oops. Informe sua senha secreta!"
#   end