# frozen_string_literal: true

class InitiativesController < ApplicationController
  before_action :find_initiative, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :find_team_member_intiatives, only: [:show]

  def index
    populate_initiative_sets
  end

  def show
    @team_member = User.find(params[:id])
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
    @initiative = current_user.initiatives.find_by_id(params[:id])
    
    if @initiative.nil?
      flash[:notice] = "Route does not exist. Please check your initiative route."
      redirect_to root_path
    end
  end

  def populate_initiative_sets
    @completed_initiatives = current_user.initiatives.completed
    @incompleted_initiatives = current_user.initiatives.incompleted
  end
  
  def find_team_member_intiatives
    @completed_initiatives = current_user.team_members.find(params[:id]).initiatives.completed
    @incompleted_initiatives = current_user.team_members.find(params[:id]).initiatives.incompleted
  end
end
