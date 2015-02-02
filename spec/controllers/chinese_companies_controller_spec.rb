require 'rails_helper'

RSpec.describe Api::V1::ChineseCompaniesController, :type => :controller do
  describe "ChineseCompany API" do
    it 'retrieves all chinese companies' do
      # message = FactoryGirl.create(:message)    
      get :index

      puts response

      # test for the 200 status-code
      expect(response).to be_success
    end
  end
end
