class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    return redirect_to(new_session_path, alert: 'Неправильный email или пароль!') unless user.present?

    session[:user_id] = user.id
    redirect_to(root_path, notice: 'Вы вошли на сайт!')
  end

  def destroy
    session.delete(:user_id)

    redirect_to(root_path, notice: 'Вы вышли из аккаунта!')
  end

  private

  def user_params
    params.require(:session)
  end
end
