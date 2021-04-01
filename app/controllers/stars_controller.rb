class StarsController < ApplicationController
    def index
        stars = Star.all

        render json: stars
    end

    def show
        star = Star.find_by(id: params[:id])

        render json: star
    end

    def create

        star = Star.new(star_params)

        if star.save
            ooutput= Ooutput.find_by(id: params[:ooutput_id])
            render json: {ooutput: OoutputSerializer.new(ooutput), star: StarSerializer.new(star)}
        else
            render json: {error: "Unable to star."}
        end
    end
    
    def destroy
        star = Star.find_by(id: params[:id])

        if star.destroy
            ooutput= Ooutput.find_by(id: star.ooutput_id)
            render json: ooutput
        else
            render json: {error: "Unable to unstar."}
        end
    end

    private

    def star_params
        params.permit(:user_id, :ooutput_id)
    end
end
