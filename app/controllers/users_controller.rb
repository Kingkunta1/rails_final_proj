class UsersController < ApplicationController

  def index

    # byebug
    @users = User.all

  end

  def more_than_one_sneaker
    @users = User.more_than_one_sneaker
  end

  def show
    @user = User.find(params[:id])
    # @sneaker = Sneaker.find(params[:id])
  end

  # this loads signup form
  def new
    @user = User.new
  end

 # where user is siging up
  def create
    @user = User.new(user_params)
    # byebug
    if @user.valid?
       @user.save
        # session stores information for the user
        # we see if session username matches input username then proceed
        # then we redirect to some show path
        #  if it does not match we then render a new form
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash.now[:error] = "Try Again. "
      render :new
    end
end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  private

  def user_params
    # byebug
    params.require(:user).permit(:username,:email,:password)
    # controller => user, attribute => name
  end


end
