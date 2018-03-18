class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :destroy, :edit, :update]
  before_action :move_to_index, except: :index

  def index
    @tweets = Tweet.all.includes(:user)
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @tweet.user_id == current_user.id
      @tweet.destroy
    end
  end

  def edit
  end

  def update
    if @tweet.user_id == current_user.id
      @tweet.update(tweet_params)
      redirect_to root_path
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
    def move_to_index
    redirect_to action: 'index' unless user_signed_in?
  end
end
