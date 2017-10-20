class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to registration_complete_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to root_path
    end
  end

  def success
  end

  def show
    @user = current_user
    @groups = Group.all
  end

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
