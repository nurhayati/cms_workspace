class CategoriesController < ApplicationController
  def index
    @category = Category.all
  end


  def new
    @catgeory = Catgeory.new
  end


  def create
    if category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
    category
  end

  def edit
    category
  end


  def update
    if category.update_attributes(category_params)
      redirect_to categorys_path
    else
      render 'edit'
    end
  end


  def destroy
    if category.destroy
      redirect_to categorys_path
    end
  end


  protected
    def category
      @category ||= Category.find params[:id]
    end

    def category_params
      params.require(:category).permit(:id, :name,:post_id)
    end
end
