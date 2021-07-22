#language: pt

Funcionalidade: Cadastro
    Sendo um musico que possui equipamentos musicais
    Quero fazer o meu cadadstro no RockLov
    Para que eu possa disponibiliza-los para locacao
    @cadastro
    Cenario: Efetuar cadastro

        Dado que acesso a pagina de cadastro
        Quando efetuo o meu cadastro completo
        Entao sou redirecionado para o Dashboard
    # @tentativa_cadastro
    # Cenario: Efetuar cadastro sem o nome

    #     Dado que acesso a pagina de cadastro
    #     Quando efetuo o meu cadastro sem o nome
    #     Entao vejo a mensagem de alerta: "Oops. Informe seu nome completo!"
    # @tentativa_cadastro
    # Cenario: Efetuar cadastro sem o email

    #     Dado que acesso a pagina de cadastro
    #     Quando efetuo o meu cadastro sem o email
    #     Entao vejo a mensagem de alerta: "Oops. Informe um email válido!"
    # @tentativa_cadastro
    # Cenario: Submeter cadastro com email incorreto

    #     Dado que acesso a pagina de cadastro
    #     Quando efetuo o meu cadastro com email incorreto
    #     Entao vejo a mensagem de alerta: "Oops. Informe um email válido!"
    # @tentativa_cadastro
    # Cenario: Efetuar cadastro sem a senha

    #     Dado que acesso a pagina de cadastro
    #     Quando efetuo o meu cadastro sem a senha
    #     Entao vejo a mensagem de alerta: "Oops. Informe sua senha secreta!"

    @esquemadocenario
    Esquema do Cenario: Tentativa de cadastro

        Dado que acesso a pagina de cadastro
        Quando submeto o seguinte formulario de cadastro:
            | nome         | email         | senha         |
            | <nome_input> | <email_input> | <senha_input> |
        Entao vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | nome_input | email_input        | senha_input | mensagem_output                  |
            |            | gabriel.@gmail.com | pwd123      | Oops. Informe seu nome completo! |
            | Gabriel    |                    | pwd123      | Oops. Informe um email válido!   |
            | Gabriel    | gabriel&gmail.com  | pwd123      | Oops. Informe um email válido!   |
            | Gabriel    | gabriel.@gmail.com |             | Oops. Informe sua senha secreta! |