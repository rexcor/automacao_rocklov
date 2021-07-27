class EquiposPage
include Capybara::DSL

    def create(equipo)
        #checkpoint com timeout explicito
        page.has_css?("#equipoForm")
        #validacao se imagem for vazio nao realizar upload
        upload(equipo[:thumb]) if equipo[:thumb].length > 0
        find("#name").set equipo[:nome]
        select_categoria(equipo[:categoria]) if equipo[:categoria].length > 0
        find("#price").set equipo[:preco]
        click_button "Cadastrar"
    end

    def select_categoria(categoria)
        find("#category").find('option', text: categoria).select_option
    end

    def upload(filename)
        thumb = Dir.pwd + "/features/support/fixtures/images/" + filename
        find("#thumbnail input[type=file]", visible: false).set thumb
    end

end