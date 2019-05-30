class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :require_admin, except: [:team_members]

  def index
    if current_user.is_admin?
      @users = User.all
    else
      @users = current_user.team_members
    end
  end

  def team_members
    if current_user.team_members.any?
      @users = current_user.team_members
      render :index
    else
      flash[:notice] = "Invalid route"
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    if @user.update(user_params)
      flash[:notice] = "#{@user.fullname}'s information was successfully edited"
      redirect_to :users
    else
      render :edit
    end
  end
  
  def destroy
    if @user.destroy
      flash[:notice] = "User: #{@user.fullname} was successfully deleted"
      redirect_to users_path
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:fullname, :email, :is_admin, :team_leader_id, :password)
    end
end
