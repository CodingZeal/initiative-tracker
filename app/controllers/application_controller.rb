# frozen_string_literal: true
class ApplicationController < ActionController::Base
  def require_admin
    unless current_user&.is_admin
      flash[:notice] = "You are not an admin"
      redirect_to root_path
    end
  end
  # def right_owner
  #   unless current_user.id == @initiative.user_id
  #     flash[:notice] = "You are not an onwer of this initiative"
  #     redirect_to root_path
  #   end
  # end
end
