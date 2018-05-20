require 'rails_helper'

describe TweetsController, type: :controller do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:tweet) { create(:tweet) }
  let(:tweets) { create_list(:tweet, 10)}

  describe 'GET #index' do
    it 'renders the :index template' do
      get :index
      expect(response).to render_template :index
    end

    it 'assigns the requested tweets to @tweets' do
      get :index
      expect(assigns(:tweets)).to eq(tweets)
    end
  end

  describe 'GET #new' do
    before do
      login_user user
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    before do
      login_user user
    end
    it "renders the :show template" do
      get :show, params: { id: tweet.id }
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    before do
      login_admin admin
    end

    it "renders the :edit template" do
      get :edit, params: { id: tweet.id }
      expect(response).to render_template :edit
    end

    it "assigns the requested tweet to @tweet" do
      get :edit, params: { id: tweet.id }
      expect(assigns(:tweet)).to eq tweet
    end
  end

  describe 'POST #create' do
    context "when user login and successed saving tweet" do

      before do
        login_user user
      end

        it "saved in the database" do
          expect{ post :create, params: { id: user.id, tweet: attributes_for(:tweet) } }.to change(Tweet, :count).by(1)
        end

        it "renders the :index template" do
          get :index, params: { id: user.id }
          expect(response).to render_template :index
        end
    end

    context "when user login and failed saving tweet" do
      before do
        login_user user
      end
      it "not saved in the database" do
        expect{ post :create, params: { id: user.id, tweet: attributes_for(:tweet, text: nil, image: nil) }}.to change(Tweet, :count).by(0)
      end

      it "renders the :index template" do
        get :index, params: { id: user.id }
        expect(response).to render_template :index
      end
    end
  end

  describe 'PATCH #update' do
    context "as an authorized user" do
      before do
        login_admin admin
      end

      it "updates a tweet" do
        tweet = create(:tweet, text: "Past Tweet")
        tweet_params = attributes_for(:tweet, text: "New Tweet")
        patch :update, params: { id: tweet.id, tweet: tweet_params }
        expect(tweet.reload.text).to eq "New Tweet"
      end
    end

    context "as an current user" do
      before do
        login_user user
      end

      it "updates the tweet" do
        tweet = create(:tweet, text: "Past Tweet", user_id: user.id)
        tweet_params = attributes_for(:tweet, text: "New Tweet")
        patch :update, params: { id: tweet.id,  tweet: tweet_params }
        expect(tweet.reload.text).to eq "New Tweet"
      end
    end

    context "as a guest" do
      before do
        login_user user
      end

      it "does not update the tweet" do
        tweet = create(:tweet, text: "Past Tweet")
        tweet_params = attributes_for(:tweet, text: "New Tweet")
        patch :update, params: { id: tweet.id,  tweet: tweet_params }
        expect(tweet.reload.text).to eq "Past Tweet"
      end
    end
  end
end
