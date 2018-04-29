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
end
