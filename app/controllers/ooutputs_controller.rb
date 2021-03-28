class Api::V1::OoutputsController < ApplicationController

    def index
        ooutputs = Ooutput.all

        render json: ooutputs
    end
end
