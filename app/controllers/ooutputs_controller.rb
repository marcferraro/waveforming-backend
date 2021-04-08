class OoutputsController < ApplicationController

    def index
        ooutputs = Ooutput.all

        render json: ooutputs
    end

    def create

        if params[:title] == ""
            params[:title] = "Untitled"
        end

        ooutput = Ooutput.new(user_id: params[:user_id], input_id: params[:input_id], title: params[:title], n: params[:n], symmetry: params[:symmetry], ground: params[:ground], periodic_input: params[:periodic_input], periodic_output: params[:periodic_output])
        ooutput.ooutput_data_uri = params[:ooutput]
        
        if ooutput.save
            render json: ooutput
        else
            render json: {error: "Unable to save output."}
        end
    end

    def destroy
        byebug
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
