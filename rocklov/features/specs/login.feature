#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    Para que eu possa anunciar meus equipamentos musicais
    @login
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais válidas com "gabriel_teste@gmail.com" e "pwd123"
        Então sou redirecionado para o Dashboard
    # @tentativaslogin
    # Cenario: Senha incorreta

    #     Dado que acesso a página principal
    #     Quando submeto minhas credenciais com senha incorreta
    #     Então vejo a mensagem de alerta: Usuário e/ou senha inválidos.
    # @tentativaslogin
    # Cenário: Email não cadastrado

    #     Dado que acesso a página principal
    #     Quando submeto minhas credenciais com email que não existe na Rocklov
    #     Então vejo a mensagem de alerta: Usuário e/ou senha inválidos.
    # @tentativaslogin
    # Cenario: Email incorreto

    #     Dado que acesso a página principal
    #     Quando submeto minhas credenciais com email incorreto
    #     Então vejo a mensagem de alerta: Oops. Informe um email válido!
    # @tentativaslogin
    # Cenario: Email não informado

    #     Dado que acesso a página principal
    #     Quando submeto minhas credenciais sem o email
    #     Então vejo a mensagem de alerta: Oops. Informe um email válido!
    # @tentativaslogin
    # Cenario: Senha não informada

    #     Dado que acesso a página principal
    #     Quando submeto minhas credenciais sem a senha
    #     Então vejo a mensagem de alerta: ops. Informe sua senha secreta!

    @esquematentativalogin
    Esquema do Cenario: Tentativa de login

        Dado que acesso a página principal
        Quando submeto minhas credenciais válidas com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"

        Exemplos:
            | email_input        | senha_input | mensagem_output                  |
            | gabriel.@gmail.com | abc123      | Usuário e/ou senha inválidos.    |
            | teste123@gmail.com | teste123    | Usuário e/ou senha inválidos.    |
            | gabriel.$gmail.com | pwd123      | Oops. Informe um email válido!   |
            |                    | pwd123      | Oops. Informe um email válido!   |
            | gabriel.@gmail.com |             | Oops. Informe sua senha secreta! |