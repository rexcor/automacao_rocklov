Entao('sou redirecionado para o Dashboard') do
    expect(page).to have_css ".dashboard"
end

Entao('vejo a mensagem de alerta: {string}') do |expect_alert|
    expect(@alert.dark).to eql expect_alert
end