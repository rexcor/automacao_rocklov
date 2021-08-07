require 'mongo'

class MongoDB    
    attr_accessor :users, :equipos, :client
    
    def initialize
        @client = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        @users = client[:users]
        @equipos = client[:equipos]
    end

    def remove_user(email)
        users.delete_many({email: email})
    end
    
    def get_user(email)
        user = users.find({email: email}).first
        return user[:_id]
    end

    def remove_equipo(name, user_id)
        #Converte o user_id de string para ObjectID onde o banco de dados reconhece
        obj_id = BSON::ObjectId.from_string(user_id)
        @equipos.delete_many({name: name, user: obj_id})
    end

    def get_mongo_id
        return BSON::ObjectId.new
    end

    def drop_danger
        @client.database.drop
    end

    def insert_users(docs)
        @users.insert_many(docs)
    end

end


