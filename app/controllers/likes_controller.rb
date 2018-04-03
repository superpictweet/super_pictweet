class LikesController < ApplicationController
  before_action :set_likes, only: [:create, :destroy]
  before_action :all_tweets, only: [:create, :destroy]

  def create
    @like = Like.create(user_tweet_params)
  end

  def destroy
    like = Like.find_by(user_tweet_params)
    like.destroy
  end

  private
  def user_tweet_params
    params.permit(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

  def set_likes
    @likes = Like.where(tweet_id: params[:tweet_id])
  end

  def all_tweets
    @tweets = Tweet.all
  end
end
