class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :destroy, :edit]

  def index
    @tweets = Tweet.all
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

  private
  def tweet_params
    params.require(:tweet).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
