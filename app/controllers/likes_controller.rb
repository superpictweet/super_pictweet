class LikesController < ApplicationController
  before_action :set_tweet, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: params[:user_id], tweet_id: params[:tweet_id])
    render json: { like_id: @like.id }
  end

  def destroy
    like = Like.find_by(user_id: params[:user_id], tweet_id: params[:tweet_id])
    like.destroy
    render json: { like_id: nil }
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
