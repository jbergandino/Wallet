class BalancesController < ApplicationController
  def new
    @balance = Balance.new
  end

  def create
  	# amount = params
  	redirect_to root_path
  end

  def edit
  	 @balance = Balance.where(user_id:session[:user_id]).first
  end

  def update
  	id = session[:user_id]
    if User.where(id:params[:recipient]).length > 0 
    	@balance = Balance.where(user_id:id).first
    	@balance2 = Balance.where(user_id:params[:recipient]).first
      balanceId = @balance.id
      currentBalance = @balance.cash
      cashTransferred = params[:cash].to_i
      thisNewBalance = currentBalance - cashTransferred
      recipientId = Balance.where(user_id:params[:recipient]).first.id
      recipientBalance = Balance.where(user_id:params[:recipient]).first.cash
      recipientNewBalance = recipientBalance + cashTransferred
      @balance.update(cash:thisNewBalance)
      @balance2.update(cash:recipientNewBalance)
      flash[:notice] = "Funds Successfully Transferred"
      redirect_to root_path
    else
      flash[:notice] = "User Does Not Exist, Transaction Cancelled"
      redirect_to root_path
    end
  end

end
