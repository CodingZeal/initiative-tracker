# frozen_string_literal: true

class InitiativesController < ApplicationController
  before_action :find_initiative, only: [:edit, :update, :destroy]

  def index
    @initiatives = Initiative.all.order("completion ASC")
  end

  def new
    @initiative = Initiative.new
  end

  def create
    @initiative = Initiative.new(initiative_params)
    if @initiative.save
      redirect_to :initiatives
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @initiative.update(initiative_params)
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
end
