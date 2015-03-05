require "rails_helper"

RSpec.describe PollsController do

  before { log_in unless RSpec.current_example.metadata[:skip_login] }

  describe "GET new" do
    it "requires the user be signed in", :skip_login do
      get :new
      expect(response).to redirect_to login_path
    end

    it "renders the new user view" do
      get :new
      expect(response).to render_template :new
      expect(assigns(:poll)).to be_a_new Poll
    end
  end

  describe "POST create" do
    let(:poll_params) do
      {
        question: "For whom tolls the bell?",
        choices_attributes: {
          "1" => { text: "Me" },
          "2" => { text: "Thee" },
        },
      }
    end

    it "creates a poll" do
      expect {
        post :create, poll: poll_params
      }.to change(Poll, :count).from(0).to 1

      poll = Poll.take
      expect(poll.question).to eq "For whom tolls the bell?"
      expect(poll.choices.map(&:text)).to match_array ["Me", "Thee"]
    end

    it "redirects to the polls" do
      post :create, poll: poll_params
      expect(response).to redirect_to polls_path
    end

    it "requires at least two choices" do
      expect {
        post :create, poll: poll_params.merge(choices_attributes: { "1" => { text: "Thee" } })
      }.not_to create_a Poll
      expect(response).to render_template :new
      expect(assigns(:poll).errors).not_to be_empty
    end

    it "can prevent creation of choices" do
      expect {
        post :create, poll: poll_params.merge(choices_attributes: {
          "1" => { text: "Me" },
          "2" => { text: "Thee" },
          "3" => { text: "Thou", _destroy: true },
        })
      }.to create_a(Poll).with_attributes(number_of_choices: 2)
    end
  end
end
