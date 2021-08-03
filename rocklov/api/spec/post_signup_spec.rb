describe "POST /signup" do
    
    context "novo usuario"do
        before(:all) do
            payload = {name: "Alex", email: "alex@google.com.br", password: "pwd123"}
            MongoDB.new.remove_user(payload[:email])
            @result = Signup.new.create(payload)
        end
        
        it "valida status code" do  
            expect(@result.code).to eql 200
        end

        it "valida id do usuario" do
            expect(@result.parsed_response["_id"].length).to eql 24
        end

    end

    context "usuario ja cadastrado" do
        before(:all) do
            payload = {name: "Arya Stark", email: "arya@stark.com.br", password: "pwd123"}
            MongoDB.new.remove_user(payload[:email])
            Signup.new.create(payload)
            @result = Signup.new.create(payload)
        end

        it "valida status code" do
            expect(@result.code).to eql 409
        end

        it "mensagem de erro" do
            expect(@result.parsed_response["error"]).to eql "Email already exists :("
        end

        it "valida bussiness code 1001" do
            expect(@result.parsed_response["code"]).to eql 1001
        end
    end

    examples = [
        {
            title: "Nome em branco",
            payload: {name: "", email: "arya@stark.com.br", password: "pwd123"},
            code: 412,
            error: "required name",
        },
        {
            title: "Sem campo nome",
            payload: {email: "arya@stark.com.br", password: "pwd123"},
            code: 412,
            error: "required name",
        },
        {
            title: "Email em branco",
            payload: {name: "Arya", email: "", password: "pwd123"},
            code: 412,
            error: "required email",
        },
        {
            title: "Sem campo email",
            payload: {name: "Arya", password: "pwd123"},
            code: 412,
            error: "required email",
        },
        {
            title: "Email invalido",
            payload: {name: "Arya", email: "arya#stark.com.br", password: "pwd123"},
            code: 412,
            error: "wrong email",
        },
        {
            title: "Senha em branco",
            payload: {name: "Arya", email: "arya@stark.com.br", password: ""},
            code: 412,
            error: "required password",
        },
        {
            title: "Sem campo senha",
            payload: {name: "Arya", email: "arya@stark.com.br"},
            code: 412,
            error: "required password",
        }
    ]

    examples.each do |e|
        context "#{e[:title]}" do
            before(:all) do
                @result = Signup.new.create(e[:payload])
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