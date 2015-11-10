class UsersController < ApplicationController

  
  def index
  end

  def profile
  end

  def show
  end


  def new
    @user = User.new
  end
  def create

    fname = params[:user][:fname]
    lname = params[:user][:lname]
    username = params[:user][:username]
    phone = params[:user][:phone]
    email = params[:user][:email]
    email_confirmation = params[:user][:email_confirmation]
    password = params[:user][:password]
    password_confirmation = params[:user][:password_confirmation]

    user = User.new(fname:fname, lname:lname, username:username, email:email, email_confirmation:email_confirmation,
      password:password,password_confirmation:password_confirmation, phone:phone)

    if user.save
      flash[:alert] = "New User Created, Please Login"
      cash = Balance.create(user_id:user.id, cash:5000.00)
      redirect_to login_path
    else
      if user.errors.full_messages.any?
        user.errors.full_messages.each do |message| 
        # binding.pry
        flash[:alert] = "Message Alert"
      end

      end
      # binding.pry
      flash[:alert] = "Error Creating User, Please Try Again"
      redirect_to new_user_path   
    end

      # redirect_to new_user_path   
  end


  def edit
  end
  def update
  end

end
