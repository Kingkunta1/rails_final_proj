class SneakersController < ApplicationController
  before_action :set_sneaker, only:[:edit,:update,:destroy]

  def index

    if params[:user_id]
      # if we find a user , loçok for all sneakers for that user
    # search for user
      @sneakers = User.find(params[:user_id]).sneakers
        # binding.pry
    # specifically looking for user with find
      if @user.nil?
      # if user comes up as not there == nil

        flash[:alert] = "User not here."
      #  execute message
      # go to user index page if user can't be foun
      else
        @sneakers = Sneaker.all
      end
    end

  end

  def show
      # we use the user_id inputed
      # binding.pry
      if params[:user_id]
        # trying to find the user specifically
        @user = User.find_by(id: params[:user_id])
        # looking specifically for a sneaker to see if it matches the user's sneakers
        @sneaker = @user.sneakers.find_by(id: params[:id])

        if @sneaker.nil?
          # if we cannot find the sneaker then
          redirect_to users_sneakers_path(@user)
        end

          else

            @sneaker = Sneaker.find(params[:id])
          end

  end

  def new
    @sneaker = Sneaker.new
    # byebug
  end

  def create
    # new sneaker is being created by a current user
    @sneaker = current_user.sneakers.build(sneaker_params)
    # @sneaker.save
    if @sneaker.save
        # @sneaker.save
        redirect_to sneaker_path(@sneaker)
        # new http request with redirect
      else
        render :new
        # render allows the sent request to be retained and showing the file/data
      end


  end

  def edit
    # binding.pry
    # set_sneaker
  end

  def update
    if @sneaker.valid?
      @sneaker.update(sneaker_params)
      # binding.pry
      redirect_to sneaker_path(@sneaker)
    else
      flash[:error] = @sneaker.errors.full.messages
      render :edit
    end
  end

  def destroy
    if @sneaker.user_id  == current_user.id
      @sneaker.destroy
      redirect_to user_path(current_user)
    else
      redirect_to users_path
    end

  end

  private

  def set_sneaker
      @sneaker = Sneaker.find(params[:id])
  end

  def sneaker_params
    # byebug
    params.require(:sneaker).permit(:name,:color,:shoesize,:user_id,:brand_id,:store_id,:category_id)
    # controller => sneaker, attribute => name
  end
end
