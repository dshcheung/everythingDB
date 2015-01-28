module Api
  module V1
    class AirlinesController < ApplicationController

      def index
        @airlines = Airline.includes(:airplanes).all
      end

      def show
        @airline = Airline.includes(:airplanes).find_by(:icao => params[:icao])
      end

    end
  end
end
