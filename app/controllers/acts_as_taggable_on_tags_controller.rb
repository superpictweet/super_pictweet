class ActsAsTaggableOnTagsController < ApplicationController
  def index
    @search = ActsAsTaggableOn::Tag.ransack(params[:q])
    @search_tags = @search.result(distinct: true)
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @tag_tweets = Tweet.tagged_with(@tag)
  end
end
