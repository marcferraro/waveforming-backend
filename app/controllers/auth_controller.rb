class AuthController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        
        if user
            if user.authenticate(params[:password])
                #create token and send to front end, save it in localStorage

                payload = {user_id: user.id}

                hmac_secret = Rails.application.credentials.hmac_secret

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
        hmac_secret = Rails.application.credentials.hmac_secret

        begin
            decoded_token = JWT.decode(token, hmac_secret, true, {algorithm: 'HS256'})
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
