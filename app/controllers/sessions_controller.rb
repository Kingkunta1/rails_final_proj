
class SessionsController < ApplicationController

  def new
    # creating the login for the user
    @user = User.new
    #  go to the session# login view
    render :login

    # byebug
  end

  def create
    # 1. search for user to see if username is in database
    # 2. if username is found within database and it verifies with saved info
    # 3. go to users show page
    # 4. if it does not authenticate
    # 5. flash error message
    # 6. go back to login form
    # @user = User.find_by(username: params[:user][:username])
    # binding.pry
    @user = User.find_by(username: params[:username])
    # binding.pry
    if @user && @user.authenticate(params[:password])

      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Try again."
      redirect_to "/login"
    end
  end
  # def create
  #   @user = User.find_by(name: params[:name])
  #   if @user && @user.authenticate(params[:password])
  #     flash[:messages] = "Logging in #{@user.name}"
  #     session[:user_id] = @user.id
  #     redirect_to locations_path
  #   else
  #     flash[:messages] = "Incorrect username or password"
  #     redirect_to new_login_path
  #   end
  # end


  def home

  end

# this is logout action
  def destroy
    session.clear
    redirect_to '/'
  end

  # validates :username,:email, presence: true
  # validates :email, :username, uniqueness: true
  # validates :username, length: { minimum: 5 }
  # validates :password, length: {minimum: 5}


  def google
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      u.password = auth['uid']

  end
      #
    session[:user_id] = @user.id
    # binding.pry
    redirect_to user_path(@user)

  end

    private

  def auth
      request.env['omniauth.auth']
  end

end
