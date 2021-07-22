Entao('sou redirecionado para o Dashboard') do
    expect(page).to have_css ".dashboard"
end

Entao('vejo a mensagem de alerta: {string}') do |expect_alert|
    alert = find(".alert-dark")
    expect(alert.text).to eql expect_alert
end