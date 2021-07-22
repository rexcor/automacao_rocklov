Dado('que acesso a pagina de cadastro') do
    visit "/signup"
end
  
Quando('efetuo o meu cadastro completo') do
    MongoDB.new.remove_user("gabriel.@gmail.com")
    find("#fullName").set "Gabriel"
    find("#email").set "gabriel.@gmail.com"
    find("#password").set "teste123"
    click_button "Cadastrar"
end

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

Quando('submeto o seguinte formulario de cadastro:') do |table|
  user = table.hashes.first
  MongoDB.new.remove_user(user[:email])
  find("#fullName").set user[:nome]
  find("#email").set user[:email]
  find("#password").set user[:senha]
  click_button "Cadastrar"
end

Entao('vejo a mensagem de alerta: {string}') do |expect_alert|
    alert = find(".alert-dark")
    expect(alert.text).to eql expect_alert
end