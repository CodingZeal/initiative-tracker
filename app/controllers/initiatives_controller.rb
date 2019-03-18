# frozen_string_literal: true

class InitiativesController < ApplicationController
  before_action :find_initiative, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def index
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    populate_initiative_sets
=======
    @initiatives = Initiative.all.order("completion ASC")
>>>>>>> model test passed, rubocop passed, indicator of completion displayed on individual initiative card, completed initiatives will appear separately from incomplete initiatives on list view page
=======
    @initiatives = Initiative.all.order(:completion)
>>>>>>> testing WIP
=======
    # @initiatives = Initiative.all
    @completed_initiatives = Initiative.completed
    @incompleted_initiatives = Initiative.incompleted
>>>>>>> modified seperate complete and incomplete initiaves
  end

  def new
    @initiative = Initiative.new
  end

  def create
    @initiative = Initiative.new(initiative_params)
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
      render 'initiatives#edit'
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
    @initiative = Initiative.find(params[:id])
  end

  def populate_initiative_sets
    @completed_initiatives = Initiative.completed
    @incompleted_initiatives = Initiative.incompleted
  end
end
