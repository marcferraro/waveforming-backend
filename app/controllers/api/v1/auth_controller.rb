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
        token = request.headers[:authorization].split(' ')[1]

        begin
            decoded_token = JWT.decode(token, "$3CRET", true, {algorithm: 'HS256'})
            user = User.find_by(id: decoded_token[0]['user_id'])
            if user
                render json: user
            else
                render json: {error: "User not found."}  
            end
        rescue
            render json: {error: "Invalid token."}
        end


        
    end
    
end
