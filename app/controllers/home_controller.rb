class HomeController < ApplicationController
  def index
  	@id = session[:user_id]
  	if session[:user_id]
  	  @user = User.find(@id)
  	end

  	# If you add Landing Page Code
  	# if !session[:user_id]
  	#   render :layout => false
  	# end
  end
end

