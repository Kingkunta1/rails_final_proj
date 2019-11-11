class BrandsController < ApplicationController

  def index
    # binding.pry
    if params[:q]
      @brands = Brand.where('name LIKE ?', params[:q] )
    @brands = Brand.all
    # would params[:q]!= search
  end
end

 def new
   @brand = Brand.new
 end

 def create
  @brand = Brand.create(brands_params)
 end

  def  show
    @brand = Brand.find(params[:id])
  end

  def search
    # binding.pry

    @brand = Brand.find_by(name: params[:q])
      redirect_to @brand
    # binding.pry
  end

  private

  def brands_params
    params.require(:brand).permit(:name,:store_id)
  end

end
