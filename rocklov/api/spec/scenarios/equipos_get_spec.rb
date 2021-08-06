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

    context "Equipo nao existe" do

        before(:all) do
            @result = Equipos.new.find_by_id(MongoDB.new.get_mongo_id, @user_id)
        end

        it  "Deve retornar 404" do
            expect(@result.code).to eql 404
        end

    end

end

describe "GET /equipos" do

    before(:all) do
            payload = {email: "jon_snow@stark.com.br", password: "pwd123"}
            result = Sessions.new.login(payload)
            @user_id = result.parsed_response["_id"]
    end

    context "Obter lista de equipos" do
        # dado que tenha uma lista de equipos
        before(:all) do
            payloads = [
                {
                    thumbnail: Helpers::get_thumb("conga.jpg"),
                    name: "Conga",
                    category: "Outros",
                    price: 299,
                },
                {
                    thumbnail: Helpers::get_thumb("violino.jpg"),
                    name: "Viviolino",
                    category: "Cordas",
                    price: 699,
                },
                {
                    thumbnail: Helpers::get_thumb("telecaster.jpg"),
                    name: "TelaCaster",
                    category: "Cordas",
                    price: 529,
                }
            ]

            payloads.each do |payload|
                MongoDB.new.remove_equipo(payload[:name], @user_id)
                Equipos.new.create(payload, @user_id)
            end

            #quando faco uma requisicao get para /equipos
            @result = Equipos.new.list(@user_id)
        end    
            
        it "Deve retornar 200" do
            expect(@result.code).to eql 200
        end

        it "Deve retornar uma lista de equipos" do
            expect(@result.parsed_response).not_to be_empty
        end
    end
end