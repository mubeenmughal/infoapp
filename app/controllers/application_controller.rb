class ApplicationController < ActionController::Base
	
	add_flash_types :info, :danger, :warning, :success

	rescue_from ActiveRecord::RecordNotFound do
		render file: 'public/404.html', status: :not_found
	end    
end
