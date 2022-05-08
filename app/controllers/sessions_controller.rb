class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      if user.admin == true
        redirect_to admin_questions_index_url notice: '管理者としてログインしました'
      else
        redirect_to root_url, notice: 'ログインしました'
      end
    else
      render :new
    end
  end

  def destroy
    redirect_to root_url, notice: 'ログアウトしました'
    reset_session
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
