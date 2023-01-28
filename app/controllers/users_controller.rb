class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    redirect_to(root_path, notice: 'Вы успешно зарагестрированы!') if @user.save

    flash.now[:alert] = 'Вы неправильно заполнили поля формы регистрации!'
    render(:new)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    redirect_to(root_path, notice: 'Данные пользователя обновлены!') if @user.update(user_params)

    flash.now[:alert] = 'Вы неправильно заполнили поля формы редактирования!'
    render(:edit)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    session.delete(:user_id)

    redirect_to(root_path, notice: 'Пользователь удалён!')
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :password_confirmation)
  end
end
