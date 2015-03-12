class Api::V1::RfisController < ApplicationController

  respond_to :json

  def index
    # current user comes from sign_in in the application_controller
    @rfis = current_user.rfis
    render json: @rfis, success: true, status: 200
  end

  def show
    @rfi = Rfi.find_by_id(params[:id])
    # USE RABL gem for custom API responses, e.g. want to show categories
    render json: @rfi, success: true, status: 200
  end

  def create
    @rfi = Rfi.create!( user_id: current_user.id, title: params[:title]) 
    Category.create!( rfi_id: @rfi.id,
                      text: "New Category")
    render json: @rfi, success: true, status: 201
  end

  def update
    @rfi = Rfi.find_by_id(params[:id])
    @rfi.update_attributes(:title => params[:title])
    render json: @rfi, success: true, status: 200
  end

  def destroy
    # How do we return the next RFI thats not deleted?
    # Maybe call from index, and take the first one?
    Rfi.destroy(params[:id])
    render json: { success: true, message: "Successfully deleted RFI."}, status: 200
  end
end
