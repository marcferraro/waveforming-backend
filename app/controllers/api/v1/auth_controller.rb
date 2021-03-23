class Api::V1::AuthController < ApplicationController

    def create

        user = User.find_by(username: params[:username])
        
        if user
            if user.authenticate(params[:password])
                #create token and send to front end, save it in localStorage

                payload = {user_id: user.id}

                hmac_secret = "$3CRET"

                token = JWT.encode(payload, hmac_secret, 'HS256')

                render json: {user: UserSerializer.new(user), token: token}
            else
                render json: {error: "Wrong password."}
            end
        else
            render json: {error: "User not found."}
        end

    end

    def show
        render json: {hello: "world"}
    end
    
end
