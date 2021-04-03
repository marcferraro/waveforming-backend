class InputsController < ApplicationController

    def index
        inputs = Input.all

        render json: inputs
    end

    def create
        if params[:input_title] == ""
            params[:input_title] = "Untitled"
        end
        
        input = Input.new(title: params[:input_title], user_id: params[:user_id])
        input.input_data_uri = params[:input]

        
        if input.save

            params.each do |key, value|
                if key.to_s.include? "color"
                    color = Color.new(hex: value, input_id: input.id)
                    color.save
                end
            end

            render json: input
        else
            render json: {error: "Unable to save input."}
        end

    end
end
