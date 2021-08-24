require_relative "base_service"

class EquiposServices < BaseService

    def create(equipo, user_id)
        
        payload = equipo

        self.class.post(
            "/equipos",
            body: payload,
            headers: {
                "user_id": user_id
            }
        )
    end

end