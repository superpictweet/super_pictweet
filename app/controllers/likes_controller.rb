class LikesController < ApplicationController
  before_action :set_likes, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    like.destroy
  end

  private
  def set_likes
    @likes = Like.where(tweet_id: params[:tweet_id])
  end
end
