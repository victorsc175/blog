require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to render_template(:index)
    end
  end
  
  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to render_template(:about)
    end
  end

end
