class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
<<<<<<< HEAD
    if @user.save
      redirect_to :users
    else
      render :new
=======

<<<<<<< HEAD
      if @user.save
        redirect_to :users
<<<<<<< HEAD
      else  
>>>>>>> deleted unnecessary files, cleaned up white spaces, rspec for users pass
=======
      else
>>>>>>> resolved whitespace issues and resolved div tag issues, removed inline styling from users/index.html.erb
=======
    if @user.save
      redirect_to :users
    else
      render :new
>>>>>>> login page functional, WIP testing, applied css for login page
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
<<<<<<< HEAD
<<<<<<< HEAD
      params.require(:user).permit(:fullname, :email, :is_admin, :team_leader_id, :password)
=======
      params.require(:user).permit(:fullname, :email, :is_admin, :team_leader_id)
>>>>>>> Finished integrated testing, deleted show.html.erb and resolved jason's comments
=======
      params.require(:user).permit(:fullname, :email, :is_admin, :team_leader_id, :password)
>>>>>>> added css for checkbox and dropdown, added dropdown functionality, added required password field, added logic to user model, testing WIP
    end
end
