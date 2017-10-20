class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @user = User.find(session[:user_id])
    @group = @user.groups.new(group_params)

if @group.save
  redirect_to :back
else
  flash[:errors] = @group.errors.full_messages
  redirect_to :back
end
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
    Group.find(params[:id]).destroy
    redirect_to :back
  end

  def index
  end

  def join
    User.joins(:group).where("user_id = group.user_id").select("*")
    redirect_to :back
    end


  private
  def group_params
    params.require(:group).permit(:name, :desc, :user_id)
  end
end
