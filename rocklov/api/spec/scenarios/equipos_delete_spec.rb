describe "DELETE /equipos/{equipo_id}" do 

    #Efetua o login e salva o id de usuário para utillização no header da criação de anúncio 
    before(:all) do
        payload = {email: "arya@stark.com.br", password: "pwd123"}
        result = Sessions.new.login(payload)
        @user_id = result.parsed_response["_id"]
    end

    context "Obter unico equipo" do

        before(:all) do
            #dado que eu tenho um novo equipamento
            @payload = {
                thumbnail: Helpers::get_thumb("trompete.jpg"),
                name: "Trompete",
                category: "Outros",
                price: 359,
            }
            
            MongoDB.new.remove_equipo(@payload[:name], @user_id)
            
            #e tenho o id desse equipamento
            equipo = Equipos.new.create(@payload, @user_id)
            @equipo_id = equipo.parsed_response["_id"]

            #quando faço uma requisição delete por id
            @result = Equipos.new.remove_by_id(@equipo_id, @user_id)
        end

        it "Valida status code 204" do
            expect(@result.code).to eql 204
        end

    end

    context "Equipo nao existe" do

        before(:all) do
            @result = Equipos.new.remove_by_id(MongoDB.new.get_mongo_id, @user_id)
        end

        it  "Deve retornar 204" do
            expect(@result.code).to eql 204
        end

    end

end