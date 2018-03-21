class FollowsController < ApplicationController
  def create
    followee = User.find(params[:id])
    current_user.follow(followee)

    redirect_back(fallback_location: root_path)
  end
end
