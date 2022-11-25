class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    User.create(user_params)

    redirect_to(root_path, notice: 'Вы успешно зарагестрированы!')
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password)
  end
end
