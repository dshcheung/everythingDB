class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])

    gon.company = @company

    # TODO: biggest 3 historical spread (datetime, spread, volume)
  end
end
