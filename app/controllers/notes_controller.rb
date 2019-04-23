class NotesController < ApplicationController
before_action :find_initiative, only: [:index, :new, :create, :destroy]

  def index
    redirect_to user_initiative_path(team_member, @initiative)
  end

  def new
    @note = Note.new
  end

  def create
    @note = @initiative.notes.build(note_params.merge(user_id: current_user.id))

    if @note.save
      redirect_to user_initiative_path(team_member, @initiative)
    else
      render 'initiatives/show'
    end
  end

  def destroy
    @note = @initiative.notes.find(params[:id])
    if @note.destroy
      flash[:notice] = "Note was successfully deleted"
      redirect_to user_initiative_path(team_member, @initiative)
    end
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end

  def team_member
    @team_member ||=
      if params[:user_id].blank?
        current_user
      else
        User.find(params[:user_id]) if current_user.team_members.pluck(:id).include?(params[:user_id].to_i)
      end
  end

  def find_initiative
    @initiative = team_member.initiatives.find(params[:initiative_id])
    if @initiative.nil?
      flash[:notice] = "Route does not exist. Please check your initiative route."
      redirect_to root_path
    end
  end

end
