class Api::V1::OoutputsController < ApplicationController

    def index
        ooutputs = Ooutput.all

        render json: ooutputs
    end

    def create
        byebug
    end

    private

    def ooutput_params

    end
end
