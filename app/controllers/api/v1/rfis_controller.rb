class Api::V1::RfisController < ApplicationController

  respond_to :json

  def index
    # current user comes from sign_in in the application_controller
    @rfis = current_user.rfis
    render_object(@rfis, 200)
  end

  def show
    @rfi = Rfi.find_by_id(params[:id])
    if !@rfi.nil?
      # USE RABL gem for custom API responses, e.g. want to show categories
      render_object(@rfi, 200)
    else
      invalid_query
    end
  end

  def create
    @rfi = Rfi.create!( user_id: current_user.id, title: params[:title]) 
    Category.create!( rfi_id: @rfi.id,
                      text: "New Category")
    render_object(@rfi, 201)
  end

  def update
    @rfi = Rfi.find_by_id(params[:id])
    if !@rfi.nil?
      @rfi.update_attributes(:title => params[:title])
      render_object(@rfi, 200)
    else
      invalid_query
    end

  end

  # Returns the next RFI in the list
  def destroy
    rfi = Rfi.find_by_id(params[:id])
    if !rfi.nil?
      Rfi.destroy(params[:id])
      @rfis = current_user.rfis
      render_object(@rfis.first, 200)
    else
      invalid_query
    end
  end
end
