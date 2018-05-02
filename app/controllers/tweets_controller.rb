class TweetsController < ApplicationController

  # before_action :move_to_index, except: :index
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: [:index, :new, :create, :show]

  def index
    @tweets = Tweet.all.includes(:user, :tags)
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

  def edit
    authorize @tweet
  end

  def update
    authorize @tweet
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
     render :edit
    end
  end

  def destroy
    authorize @tweet
    @tweet.destroy
  end

  private
  def move_to_index
    redirect_to action: 'index' unless user_signed_in?
  end

  def tweet_params
    params.require(:tweet).permit(:text, :image, :tag_list).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
