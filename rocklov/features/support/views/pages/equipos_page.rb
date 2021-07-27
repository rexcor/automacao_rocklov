class EquiposPage
include Capybara::DSL

    def create(equipo)
        #checkpoint com timeout explicito
        page.has_css?("#equipoForm")
        #validacao se imagem for vazio nao realizar upload
        upload(equipo[:thumb]) if equipo[:thumb].length > 0
        find("#name").set equipo[:nome]
        find("#category").find('option', text: equipo[:categoria]).select_option
        find("#price").set equipo[:preco]
        click_button "Cadastrar"
    end

    def upload(filename)
        thumb = Dir.pwd + "/features/support/fixtures/images/" + filename
        find("#thumbnail input[type=file]", visible: false).set thumb
    end

end