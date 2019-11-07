class CategoriesController < ApplicationController
  before_action :set_category, only:[:show,:destroy]


  def show

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to category_path(@category)
  end

  def destroy
    @category.destroy
  end



  private


    def set_category
        @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

end
