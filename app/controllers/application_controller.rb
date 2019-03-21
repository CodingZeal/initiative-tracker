# frozen_string_literal: true

class ApplicationController < ActionController::Base
	def require_admin
		unless current_user && current_user.is_admin
			flash[:notice] = "You are not an admin"
			redirect_to root_path
		end
	end
end
