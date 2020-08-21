class ApplicationController < ActionController::Base
	# protect_from_frogery with: exception
	add_flash_types :success, :danger
end
