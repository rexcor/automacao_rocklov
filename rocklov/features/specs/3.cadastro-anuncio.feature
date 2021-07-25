#language: pt

Funcionalidade: Cadastro de anuncios
    Sendo usuario cadastrado no Rocklov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizar para locacao

    Cenario: Novo equipo
        Dado que estou logado como "gabriel_teste@gmail.com" e "pwd123"
            E que acesso o formulario de cadastro de anuncios
            E que eu tenho o seguinte equipameto:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Entao devo ver esse item no meu Dashboard