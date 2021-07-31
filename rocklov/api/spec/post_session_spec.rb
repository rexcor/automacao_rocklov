require_relative "routes/sessions"

describe "POST /sessions" do
    context "login com sucesso" do 
        before(:all) do
            payload = {email: "gabriel_teste@gmail.com", password: "pwd123"}
            @result = Sessions.new.login(payload)
        end
    
        it "valida status code" do  
            expect(@result.code).to eql 200
        end

        it "valida id do usuario" do
            expect(@result.parsed_response["_id"].length).to eql 24
        end
    end

    examples = [
        {
            title: "Senha invalida",
            payload: {email: "gabriel_teste@gmail.com", password: "123456"},
            code: 401,
            error: "Unauthorized",
        },
        {
            title: "Usuario inexistente",
            payload: {email: "naoexiste@gmail.com", password: "pwd123"},
            code: 401,
            error: "Unauthorized"
        },
        {
            title: "Email em branco",
            payload: {email: "", password: "pwd123"},
            code: 412,
            error: "required email"
        },
        {
            title: "Sem campo email",
            payload: {password: "pwd123"},
            code: 412,
            error: "required email"
        },
        {
            title: "Senha em branco",
            payload: {email: "gabriel_teste@gmail.com", password: ""},
            code: 412,
            error: "required password"
        },
        {
            title: "Sem campo senha",
            payload: {email: "gabriel_teste@gmail.com"},
            code: 412,
            error: "required password"
        },
    ]

    examples.each do |e|
        context "#{e[:title]}" do 
            before(:all) do
                @result = Sessions.new.login(e[:payload])
            end
        
            it "valida status #{e[:code]}" do  
                expect(@result.code).to eql e[:code]
            end
    
            it "mensagem de erro" do
                expect(@result.parsed_response["error"]).to eql e[:error]
            end
        end
    end
end