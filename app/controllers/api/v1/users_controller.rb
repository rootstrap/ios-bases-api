module Api
  module V1
    class UsersController < Api::V1::ApiController
      skip_after_action :update_auth_header, only: :delete_account

      def show; end

      def profile
        render :show
      end

      def update
        current_user.update!(user_params)
        render :show
      end

      def delete_account
        current_user.destroy!
      end

      private

      def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email)
      end
    end
  end
end
