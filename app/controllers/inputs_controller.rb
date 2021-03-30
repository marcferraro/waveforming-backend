class Api::V1::InputsController < ApplicationController

    def index
        inputs = Input.all

        render json: inputs
    end

    def create
        input = Input.new(title: params[:input_title])
        input.input_data_uri = params[:input]

        if input.save
            render json: input
        else
            render json: {error: "Unable to save input."}
        end

    end
end
