class UsersController < ApplicationController
  # before_action :set_user, only:[:edit,:update,:destroy]

  def index

    # byebug
    @users = User.all

  end


  def show
    @user = User.find(params[:id])
    # @sneaker = Sneaker.find(params[:id])
  end

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
# this loads signup form

  def more_than_one_sneaker
    @users = User.more_than_one_sneaker
  end

  def edit
    @user = current_user
  end

  def update
      # current_user is session[:user_id]
      # binding.pry
       @user = current_user
        @user.update(user_params)
        if @user.valid?
          @user.save
          redirect_to user_path(@user)
        else
          flash.now[:error] = "Try Again."
          render :edit

    # @sneaker = Sneaker.find(params[:id])
    # if @sneaker.user_id  == current_user.id
    #   @sneaker.destroy
    #   redirect_to user_path(current_user)
    # else
    #   redirect_to users_path
        end
  end

  def destroy
    # binding.pry
    @user = User.find(params[:id])
     if @user.id == current_user.id
    # binding.pry
      @user.destroy
      redirect_to users_path, notice: "Delete success"
     else
      redirect_to user_path(current_user)
     end
  end

  private

  # def set_sneaker
  #       @user = User.find(params[:id])
  # end

  def user_params
    # byebug
    params.require(:user).permit(:username,:email,:password)
    # controller => user, attribute => name
  end


end
