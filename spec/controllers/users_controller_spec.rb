require "rails_helper"

RSpec.describe UsersController do

  describe "GET new" do
    it "renders the new user view" do
      get :new
      expect(response).to render_template :new
      expect(assigns(:user)).to be_a SignUp
    end
  end

  describe "POST create" do
    let(:user_params) do
      {
        username: "hal",
        password: "kubrick",
        password_confirmation: "kubrick",
        terms_of_use: "1",
      }
    end

    it "creates a user" do
      expect {
        post :create, user: user_params
      }.to create_a(User)
        .with_attributes(username: user_params.fetch(:username))
    end

    [false, "0", nil].each do |not_accepted_value|
      it "requires terms_of_use be accepted (cannot be #{not_accepted_value.inspect})" do
        expect {
          post :create, user: user_params.merge(terms_of_use: not_accepted_value)
        }.not_to create_a User
      end
    end
  end
end
