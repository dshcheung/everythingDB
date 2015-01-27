module Api
  module V1
    class AirplanesController < ApplicationController

      def index
        @airplanes = Airplane.all
      end

      def index_by_airline
        @airline = Airline.find_by(:icao => params[:airline_icao])
        @airplanes = @airline.airplanes
      end

      def show
        @airline = Airline.find_by(:icao => params[:airline_icao])
        @airplane = @airline.airplanes.find_by(:registration_code => params[:registration_code])
      end

    end
  end
end
