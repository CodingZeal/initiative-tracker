# frozen_string_literal: true

class InitiativesController < ApplicationController
  before_action :find_initiative, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!
  # before_action :find_team_member_intiative, only: [:show]

  def index  
    populate_initiative_sets
  end

  def team_members_initiatives
    @team_member = User.find(params[:user_id])
    @completed_initiatives = @team_member.initiatives.completed
    @incompleted_initiatives = @team_member.initiatives.incompleted
    render :index
  end

  def show
  end

  def new
    @initiative = Initiative.new
  end

  def create
    @initiative = current_user.initiatives.build(initiative_params)
    if @initiative.save
      populate_initiative_sets
      redirect_to :initiatives
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @initiative.update(initiative_params)
      populate_initiative_sets
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @initiative.destroy
      flash[:notice] = "Initiative: #{@initiative.title} was successfully deleted"
      redirect_to root_path
    end
  end
  
  private
  
  def initiative_params
    params.require(:initiative).permit(:title, :description, :target_date, :completion)
  end
  
  def find_initiative
    team_member
    @initiative = @team_member.initiatives.find(params[:id])
    
    if @initiative.nil?
      flash[:notice] = "Initiative not found"
      redirect_to root_path
    end
  end

  def populate_initiative_sets
    if team_member.nil?
      flash[:notice] = "Initiative not found"
      redirect_to root_path
    else
      @completed_initiatives = @team_member.initiatives.completed
      @incompleted_initiatives = @team_member.initiatives.incompleted
    end
  end
  
  def find_team_member_intiative
    @initiative = team_member.initiatives.find(params[:id])
  end

  def team_member
    @team_member ||= 
      if params[:user_id].blank?
        current_user
      else
        User.find(params[:user_id]) if current_user.team_members.pluck(:id).include?(params[:user_id].to_i)
      end
  end
end
