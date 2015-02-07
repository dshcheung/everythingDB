module Api
  module V1
    class IncomeStatementsController < ApplicationController
      def index
        company = ChineseCompany.find_by_symbol(params[:chinese_company_id])
        @annual_income_statements = company.chinese_annual_incomes.order(:period)
      end
    end
  end
end
