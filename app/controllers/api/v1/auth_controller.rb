class Api::V1::AuthController < ApplicationController

    def create
        byebug
        user = User.find_by(username: params[:username])
        
        if user

        else
            render json: {error: "Invalid username or password."}
        end

    end
    
end
