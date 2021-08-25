#langugage: pt

Funcionalidade: Receber pedido de locacao
    Sendo um anunciante que possui equipamentos cadastrados
    Desejo receber pedidos de locacao
    Para que eu possa decidir se quero aprova-los ou rejeita-los

    Cenario: Receber pedido
        Dado que meu perfil de anunciante e "anunciante@teste.com.br" e "pwd123"
            E que eu tenha o seguinte equipamento cadastrado:
            | thumb     | trompete.jpg |
            | nome      | trompete     |
            | categoria | outros       |
            | preco     | 200          |
            E acesso meu dashboard
        Quando "locataria@teste.com.br" e "pwd123" solicita a locacao desse equipamento
        Entao devo ver a seguinte mensagem:
            """
            locataria@teste.com.br deseja alugar o equipamento: Trompete em: DATA_ATUAL
            """
            E devo ver os links "ACEITAR" E "REJEITAR" no pedido