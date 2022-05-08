class UsersController < ApplicationController
  skip_before_action :login_required
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url(@user), notice: "#{@user.name}を登録しました"
    else
      render :new
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
