class NotesController < ApplicationController

  def index
    find_initiative
    redirect_to user_initiative_path(team_member, @initiative)
  end

  def new
    find_initiative
    @note = Note.new
  end

  def create
    find_initiative
    @note = @initiative.notes.build(note_params.merge(initiative_id: @initiative_id, user_id: current_user.id))

    if @note.save 
      redirect_to user_initiative_path(team_member, @initiative)
    else
      render 'initiatives/show'
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
