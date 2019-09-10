class SneakersController < ApplicationController

  def index
    @sneakers = Sneaker.all
  end

  def show
    @sneaker = Sneaker.find(params[:id])
  end

  def new
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.create(sneaker_params)

      # @sneaker.save
    redirect_to "/sneakers/#{@sneaker.id}"
  end

  def edit
    @sneaker = Sneaker.find(params[:id])
  end

  def update
    @sneaker = Sneaker.fid(parmas[:id])
    @sneaker.update 
  end

  def destroy
    @sneaker = Sneaker.find(params[:id])
    @sneaker.destroy
  end

  private

  def sneaker_params
    # byebug
    params.require(:sneaker).permit(:name)
    # controller => sneaker, attribute => name
  end
end
