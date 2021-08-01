require_relative "routes/equipos"
require_relative "routes/sessions"

describe "POST /equipos" do
    
    #Efetua o login e salva o id de usuário para utillização no header da criação de anúncio 
    before(:all) do
        payload = {email: "arya@stark.com.br", password: "pwd123"}
        result = Sessions.new.login(payload)
        @user_id = result.parsed_response["_id"]
    end

    context "novo equipo" do

        before(:all) do

            thumbnail = File.open(File.join(Dir.pwd, "spec/fixtures/images", "kramer.jpg"))

            payload = {
                thumbnail: thumbnail,
                name: "kramer guitar",
                category: "Cordas",
                price: 199,
            }

            @result = Equipos.new.create(payload, @user_id)
        end

        it "valida status 200" do
            expect(@result.code).to eql 200
        end


    end

end
