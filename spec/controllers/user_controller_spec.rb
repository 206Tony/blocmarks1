require 'rails_helper'

RSpec.describe UserController, type: :controller do

	let(:user) { create(:user) }
	before do
		login_with(:user)
	end

  describe "GET #show" do
    it "returns http success" do
      get :show, { id: user.id }
      expect(response).to have_http_status(:success)
    end
  end

end
