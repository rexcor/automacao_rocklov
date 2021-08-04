describe "GET /equipos/{equipo_id}" do 

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
                thumbnail: Helpers::get_thumb("conga.jpg"),
                name: "Conga",
                category: "Outros",
                price: 299,
            }
            
            MongoDB.new.remove_equipo(@payload[:name], @user_id)
            
            #e tenho o id desse equipamento
            equipo = Equipos.new.create(@payload, @user_id)
            @equipo_id = equipo.parsed_response["_id"]

            #quando faço uma requisição get por id
            @result = Equipos.new.find_by_id(@equipo_id, @user_id)
        end

        it "Valida status code 200" do
            expect(@result.code).to eql 200
        end

        it "Valida nome do equipo" do
            expect(@result.parsed_response).to include("name" => @payload[:name])
        end

    end

    context "equipo nao existe" do

        before(:all) do

            @result = Equipos.new.find_by_id(MongoDB.new.get_mongo_id, @user_id)

        end

        it  "deve retornar 404" do
            expect(@result.code).to eql 404
        end

    end

end