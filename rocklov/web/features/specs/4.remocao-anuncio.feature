#language: pt

Funcionalidade: Remover Anuncio
    Sendo um anunciante que possui um equipamento indesejado
    Quero poder remover esse anuncio
    Para que eu possa manter o meu Dashboard atualizado

    Contexto: Login
        * Login com "debs@hotmail.com" e "pwd123"

    Cenario: Remover um anuncio
        Dado que eu tenho um anuncio indesejado
            | thumb     | telecaster.jpg |
            | nome      | Telecaster     |
            | categoria | Cordas         |
            | preco     | 50             |
        Quando eu solicito a exclusao desse item
            E confirmo a exclusao
        Entao nao devo ver esse item no meu dashboard


    Cenario: Desistir da exclusao
        Dado que eu tenho um anuncio indesejado
            | thumb     | conga.jpg |
            | nome      | Conga     |
            | categoria | Outros    |
            | preco     | 120       |
        Quando eu solicito a exclusao desse item
            Mas nao confirmo a exclusao
        Entao esse item deve permanecer no meu dashboard