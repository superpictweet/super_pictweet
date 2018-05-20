require 'rails_helper'

RSpec.describe LikesController, type: :controller do
    let(:user) { create(:user) }
    let(:tweet) { create(:tweet) }
    let(:like) { create(:like, user_id: user.id, tweet_id: tweet.id) }

  describe "POST #create" do
    before do
      login_user user
    end

    it "responds with JSON formatted output" do
      post :create, format: :json,
      params: { tweet_id: tweet.id, id: like.id }
      expect(response.content_type).to eq "application/json"
    end

    it "add a new like to the tweet" do
      expect { post :create, format: :json, params: { tweet_id: tweet.id, id: like.id } }.to change{ Like.count }.by(1)
    end
  end

  describe "DELETE #destroy" do
    before do
      login_user user
    end

    it "responds with JSON formatted output" do
      delete :destroy, format: :json,
      params: { tweet_id: tweet.id, user_id: user.id, id: like.id }
      expect(response.content_type).to eq "application/json"
    end

    it "remove a like to the tweet" do
      like = create(:like, user_id: user.id, tweet_id: tweet.id)
      expect { delete :destroy, format: :json, params: { tweet_id: tweet.id, user_id: user.id, id: like.id } }.to change{ Like.count }.by(-1)
    end
  end
end
