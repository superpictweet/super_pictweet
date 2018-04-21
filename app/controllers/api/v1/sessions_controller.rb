module Api
  module V1
    class SessionsController < ApplicationController
      protect_from_forgery with: :null_session #CSRFは使わない

      def create
        user = User.find(params[:id])
        if user && Devise.secure_compare(user.access_token, params[:access_token])
          sign_in user
        end
      end
    end
  end
end
