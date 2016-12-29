require 'rails_helper'

RSpec.describe AdminsController, type: :controller do

  describe "GET #dashboard" do
    it "returns http unathorized" do
      get :dashboard
      expect(response).to have_http_status(401)
    end
  end

end
