class CategoriesController < ApplicationController
  before_action :set_category, only:[:show,:destroy]

  def index
    # binding.pry
    # byebug
    match = Category.where(["name LIKE ?", "%#{flash[:search]}%"])
    # subset of category objects
    if flash[:search] && (match.length != 0)
      # we set a conditional between the user's input and a truthy statement
      @all_cats = match
      # we set all the instant variable to the array set
    else
      @all_cats = Category.all
      # if the statment is false and does not match a category set_category
      #  then display all of the categories. 
    end

      # if params[:q]
        # @categories = Category.search(params[:q])

  end

  def show
    @sneakers = Sneaker.where({category: params[:id] })

    # binding.pry
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    # binding.pry

    # @category = Category.create(category_params)
    redirect_to category_path(@category)
  end

  def destroy
    @category.destroy
  end

  def category_search
   # binding.pry
     # @all_cats = Category.all
     # all the category objects
     # @categories =
     # this is subset of the search

  # 1. @categories must contain categories related to search item
  # 2. @categories needs to exist in method
  # 3. must render index at the end
      # byebug
      flash[:search] = params[:q]

      # this enables the users input

#       def index
#   if params[:store]
#    @coupon = Coupon.where('store LIKE ?', "%#{params[:store]}%")
#    else
#    @coupon = Coupon.all
#    end
#    end

      # if search
      # @categories = Category.where(["name LIKE ?", "%#{search}%"])
      # else
      # @all_cats
      # end
      # render :index
      redirect_to categories_path
  end

  private

  def set_category
        @category = Category.find(params[:id])
  end

  def category_params
      params.require(:category).permit(:name)
  end

end
