class TagsController < ApplicationController
  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @tag_tweets = Tweet.tagged_with(@tag)
  end
end
