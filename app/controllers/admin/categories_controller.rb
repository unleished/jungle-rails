class Admin::CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

  def index
    @categories = Category.all
    # @products = @category.products.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category  = Category.new(product_params)

    if @category.save
      redirect_to [:admin, :categories], notice: "Category created!"
    else
      render :new
    end
  end

  def product_params
    params.require(:category).permit(
      :name
    )
  end

end
