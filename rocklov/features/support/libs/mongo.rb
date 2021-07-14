require 'mongo'

class MongoDB
    def remove_user(email)
        client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        users = client[:users]
        users.delete_many({email: email})
    end
end


