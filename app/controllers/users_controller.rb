class UsersController < ApplicationController

    def index
        users = User.all

        render json: users
    end

    def create
        user = User.new(new_user_params)

        if user.save
                #create token and send to front end, save it in localStorage

                payload = {user_id: user.id}

                hmac_secret = Rails.application.credentials.hmac_secret

                token = JWT.encode(payload, hmac_secret, 'HS256')

                render json: {user: UserSerializer.new(user), token: token}
        else
            render json: {error: "Unable to create user."}
            # add more detailed errors later]
        end
    end

    def set_avatar

        user = User.find_by(id: params[:id])
        
        user.avatar = params[:avatar]

        if user.save!
            render json: {avatarUrl: user.avatar.url}
        else 
            render json: {error: "Unable to add Avatar."}
        end

    end

    def update_username
        user = User.find_by(id: params[:id])

        
    end

    private

    def new_user_params
        params.permit(:username, :password, :password_confirmation, :avatar)
    end
    # def user_params
    #     params.permit(:username, :password, :password_confirmation)
    # end

    
end
