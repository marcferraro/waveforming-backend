class Api::V1::AuthController < ApplicationController

    def create

        user = User.find_by(username: params[:username])
        
        if user
            if user.authenticate(params[:password])
                #create token and send to front end, save it in localStorage
                render json: user
            else
                render json: {error: "Wrong password."}
            end
        else
            render json: {error: "User not found."}
        end

    end
    
end
