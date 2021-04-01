class StarsController < ApplicationController
    def index
        stars = Star.all

        render json: stars
    end

    def create

        star = Star.new(star_params)

        if star.save
            ooutput= Ooutput.find_by(id: params[:ooutput_id])
            render json: ooutput
        else
            render json: {error: "Unable to star."}
        end
    end

    private

    def star_params
        params.permit(:user_id, :ooutput_id)
    end
end
