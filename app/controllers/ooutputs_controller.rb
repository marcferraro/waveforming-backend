class OoutputsController < ApplicationController

    def index
        ooutputs = Ooutput.all

        render json: ooutputs
    end

    def create
        byebug
        ooutput = Ooutput.new(user_id: params[:user_id], input_id: params[:input_id], title: params[:title])
        ooutput.ooutput_data_uri = params[:ooutput]

        # if params[:input_id]
        #     ooutput.input_id = params[:input_id]

            
        # elsif params[:input]
        #     if !params[:input_title]
        #         params[:input_title] = "Untitled"
        #     end

        #     input = Input.new(title: params[:input_title])
        #     input.input_data_uri = params[:input]
        #     input.save

        #     ooutput.input_id = 

            
        # end
        
        if ooutput.save
            render json: ooutput
        else
            render json: {error: "Unable to save output."}
        end
    end

    private

    def ooutput_params_new_input
        params.permit(:user_id, :title, :ooutput)
    end

    def ooutput_params_old_input
        params.permit(:user_id, input_id, :title, :ooutput)
    end

    def input_params
        params.permit(:input, input_title, :user_id)
    end
end
