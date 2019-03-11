# frozen_string_literal: true

class InitiativesController < ApplicationController
  def index
    @initiatives = Initiative.all
  end

  def show; 
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

  private

  def initiative_params
    params.require(:initiative).permit(:title, :description, :target_date)
  end
end
