module Api
  module V1
    class TweetsController < ApplicationController
      def index
        tweets = Tweet.all
        render json: tweets
      end

      def show
        tweet = Tweet.find(params[:id])
        render json: tweet
      end

      def create
      end


      def update
      end
    end
  end
end
