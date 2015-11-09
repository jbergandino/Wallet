class SharedcardsController < ApplicationController



	def create
      userToShareWith = params[:sharedcard][:user_id]
      thisCardId = params[:sharedcard][:card_id]
	  @sharedCardCreate = Sharedcard.create(user_id: userToShareWith, card_id:thisCardId)

	  flash[:notice] = "Card Successfully Shared with User # #{userToShareWith}"
	  redirect_to card_path(session[:user_id])
	end












end
