class Api::V1::UsersController < ApplicationController

    def index
        users = User.all

        render json: users
    end

    def create

        user = User.new(new_user_params)

        if user.save
                #create token and send to front end, save it in localStorage

                payload = {user_id: user.id}

                hmac_secret = "$3CRET"

                token = JWT.encode(payload, hmac_secret, 'HS256')

                render json: {user: UserSerializer.new(user), token: token}
        else
            render json: {error: "Unable to create user."}
            # add more detailed errors later
        end
    end

    def set_avatar
        byebug
    end

    private

    def new_user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
