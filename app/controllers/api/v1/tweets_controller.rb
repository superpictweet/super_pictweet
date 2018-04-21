module Api
  module V1
    class TweetsController < ApplicationController
      protect_from_forgery with: :null_session #CSRFは使わない
      before_action :authenticate_user_from_token

      def index
        tweets = Tweet.all
        render json: tweets
      end

      def show
        tweet = Tweet.find(params[:id])
        render json: tweet
      end

      def create
        tweet = Tweet.new(tweet_params)
        if tweet.save
          render json: tweet
        else
          render json: { error: "データの投稿に失敗しました" }, status: 401
        end

      end

      def update
        tweet = Tweet.find(params[:tweet_id])
        binding.pry
        return if tweet.id != params[:tweet_id].to_i

        binding.pry

        if tweet.update(tweet_params)
          render json: tweet
        else
          render json: { error: "データの更新に失敗しました" }, status: 401
        end
      end

      private

      def authenticate_user_from_token
        user = User.find(params[:id])
          if user && Devise.secure_compare(user.access_token, params[:access_token])
            sign_in user
          else
            render json: { error: t('devise.failure.unauthenticated') }, status: 401
          end
      end

      def tweet_params
        params.permit(:text).merge(user_id: params[:id])
      end
    end
  end
end
