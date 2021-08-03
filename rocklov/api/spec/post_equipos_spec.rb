require_relative "routes/equipos"
require_relative "routes/sessions"
require_relative "libs/mongo"

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

            MongoDB.new.remove_equipo(payload[:name], @user_id)
            @result = Equipos.new.create(payload, @user_id)
        end

        it "valida status 200" do
            expect(@result.code).to eql 200
        end

        context "nao autorizado" do

            before(:all) do
    
                thumbnail = File.open(File.join(Dir.pwd, "spec/fixtures/images", "violino.jpg"))
    
                payload = {
                    thumbnail: thumbnail,
                    name: "Violino Stradivarius",
                    category: "Cordas",
                    price: 599,
                }

                @result = Equipos.new.create(payload, nil)
            end
    
            it "valida status 401" do
                expect(@result.code).to eql 401
            end

        end

    end

end
