class SpicesController < ApplicationController

  before_action :find_spice, only: [:show, :update, :destroy]

  def index
    spices = Spice.all
    render json: spices
  end

  # def show
  #   if @spice
  #     render json: @spice
  #   else
  #     render_not_found_error
  #   end
  # end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: 201
  end

  def update
    if @spice
      @spice.update(spice_params)
      render json: @spice
    else
      render_not_found_error
    end
  end

  def destroy
    if @spice
      @spice.delete
      render json: @spice
    else
      render_not_found_error
    end
  end

  private
    def find_spice
      @spice = Spice.find_by_id(params[:id])
    end

    def render_not_found_error
      render json: {error: "Spice not found"}, status: :not_found
    end

    def spice_params
      params.permit(:title, :image, :description, :notes, :rating)
    end


end
