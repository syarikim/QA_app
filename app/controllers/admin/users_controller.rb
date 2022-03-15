class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
    user = User.find(params[:id])
    puts user
    user.destroy
    redirect_to admin_users_index_url, notice: "「#{user.name}」を削除しました", status: :see_other
  end
end

