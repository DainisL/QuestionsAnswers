class Admin::AdministratorController < ApplicationController
	ADMIN, PASSWORD = 'a', 'a'

	before_filter :authentication_check

	private
	 	def authentication_check
	 		authenticate_or_request_with_http_basic do |admin, password|
	 			admin == ADMIN && password == PASSWORD
	 		end 
	 	end
end
