class SessionsController < ApplicationController

  def new
    # creating the login for the user
    @user = User.new
    #  go to the session# login view
    render :login
  end

  def create
    # 1. search for user to see if username is in database
    # 2. if username is found within database and it verifies with saved info
    # 3. go to users show page
    # 4. if it does not authenticate
    # 5. flash error message
    # 6. go back to login form
    @user = User.find_by(username: params[:user][:name])
    if @user && user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
    else
      flash[:error] = "Try again."
    redirect_to login_path
    end
end

  def login

  end

  def home

  end

  def destroy
    session.clear
    redirect_to '/'
  end


end
