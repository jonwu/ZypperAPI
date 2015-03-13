class Api::V1::CategoriesController < ApplicationController

  respond_to :json

  def index
    rfi = Rfi.find_by_id!(params[:rfi_id])
    @categories = rfi.categories
    render_object(@categories, 200)
  end

  def show
    @category = Category.find_by_id!(params[:id])
    render_object(@category, 200)
  end

  def create
    rfi = Rfi.find_by_id!(params[:rfi_id])
    text = Category.find_available_text(rfi.categories, params[:text])
    @category = Category.create!( rfi_id: rfi.id, text: text)
    render_object(@category, 201)
  end

  def destroy
    current_category = Category.find_by_id!(params[:id])
    current_rfi = current_category.rfi
    @next_category = Category.find_next_category_and_delete(current_rfi.categories, params[:id])
    render json: @next_category, success: true, status: 200
  end

  def update
    @category = Category.find_by_id!(params[:id])
    @category.update_attributes!(text: params[:text])
    render_object(@category, 200)
  end

end
