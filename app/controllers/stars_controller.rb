class StarsController < ApplicationController
    def index
        stars = Star.all

        render json: stars
    end
end
