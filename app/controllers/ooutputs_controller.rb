class Api::V1::OoutputsController < ApplicationController

    def index
        ooutputs = Ooutput.all

        render json: ooutputs
    end

    def create
        byebug
        ooutput = Ooutput.new(ooutput_params)
        ooutput.ooutput_data_uri = params[:ooutput]

        if ooutput.save
            render json: ooutput
        else
            render json: {error: "Unable to save output."}
        end

    end

    private

    def ooutput_params
        params.permit(:user_id, :title, :ooutput)
    end
end
