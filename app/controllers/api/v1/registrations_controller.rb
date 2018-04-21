module Api
  module V1
    class RegistrationsController < ApplicationController
      protect_from_forgery with: :null_session #CSRFは使わない
      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user
        end
      end

      private

      def user_params
        params.permit(:email, :password)
      end

    end
  end
end
