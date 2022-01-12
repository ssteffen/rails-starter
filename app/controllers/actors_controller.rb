class ActorsController < ApplicationController
    def index
        @actors = Actor.all
        respond_to do |format|
            format.html { render json: @actors }
            format.json { render json: @actors }
        end
    end
end
