Before do
    @login_page = LoginPage.new
    @signup_page = SignupPage.new
    @dash_page = DashPage.new
    @equipos_page = EquiposPage.new
    @alert = Alert.new
end

After do 
    temp_shot = page.save_screenshot("logs/temp_screenshot.png")
    #metodo do allure para inclusao do screenshot no report gerado
    Allure.add_attachment(
        name: "Screenshot",
        type: Allure::ContentType::PNG,
        source: File.open(temp_shot)
    )
end