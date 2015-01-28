module Api
  module V1
    class AirplanesController < ApplicationController

      def index
        @airplanes = Airplane.includes(:airline).all
      end

      def show
        @airplane = Airplane.includes(:airline).find_by(:registration_code => params[:registration_code])
      end

    end
  end
end
