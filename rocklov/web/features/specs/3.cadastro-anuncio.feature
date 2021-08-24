#language: pt

Funcionalidade: Cadastro de anuncios
    Sendo usuario cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizar para locacao

    Contexto: Login
        * Login com "gabriel_teste@gmail.com" e "pwd123"

    Cenario: Novo equipo
        Dado que acesso o formulario de cadastro de anuncios
            E que eu tenho o seguinte equipameto:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Entao devo ver esse item no meu Dashboard

    Esquema do Cenario: Tentativa de cadastro de anuncios
        Dado que acesso o formulario de cadastro de anuncios
            E que eu tenho o seguinte equipameto:
            | thumb     | <foto>      |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
        Quando submeto o cadastro desse item
        Entao deve conter a mensagem de alerta: "<saida>"

        Exemplos:
            | foto          | nome            | categoria | preco  | saida                                |
            |               | Violao de Corda | Cordas    | 150    | Adicione uma foto no seu anúncio!    |
            | clarinete.jpg |                 | Outros    | 250    | Informe a descrição do anúncio!      |
            | baixo.jpg     | Baixo           |           | 140    | Informe a categoria                  |
            | pedais.jpg    | Pedais          | Tecla     |        | Informe o valor da diária            |
            | sanfona.jpg   | Sanfona         | Outros    | abc    | O valor da diária deve ser numérico! |
            | sanfona.jpg   | Sanfona         | Outros    | 100a   | O valor da diária deve ser numérico! |
            | sanfona.jpg   | Sanfona         | Outros    | 100,00 | O valor da diária deve ser numérico! |

# @temp
# Cenario: Anuncio sem foto
#     Dado que acesso o formulario de cadastro de anuncios
#         E que eu tenho o seguinte equipameto:
#         | thumb     |               |
#         | nome      | Fender Strato |
#         | categoria | Cordas        |
#         | preco     | 200           |
#     Quando submeto o cadastro desse item
#     Entao deve conter a mensagem de alerta: "Adicione uma foto no seu anúncio!"