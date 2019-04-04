class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    team_member
    @initiative = Initiative.find(params[:initiative_id])
    @note = Note.new(note_params)
    @note.initiative_id = @initiative.id
    @note.user_id = current_user.id
    # @note = @initiative.notes.create(note_params)

    if @note.save
      redirect_to user_initiative_path(team_member, @initiative)
    else
      render :new
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:body, :initiative_id, :user_id)
  end
  

  def team_member
    if params[:user_id].blank?
      @team_member = current_user
    else
      @team_member = User.find(params[:user_id]) if current_user.team_members.pluck(:id).include?(params[:user_id].to_i)
    end
  end

end
