module Api
  module V1
    class AirlinesController < ApplicationController

      def index
        @airlines = Airline.includes(:airplanes).all.limit(100)
      end

      def show
        @airline = Airline.find_by(:icao => params[:icao])
      end

    end
  end
end
