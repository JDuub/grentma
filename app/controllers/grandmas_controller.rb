class GrandmasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_grandma, only: [:show, :edit, :update, :destroy]

  def index
    @grandmas = Grandma.all
    @markers = @grandmas.geocoded.map do |grandma|
      {
        lat: grandma.latitude,
        lng: grandma.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {grandma: grandma})
      }
    end
  end

  def new
    @grandma = Grandma.new
  end

  def show
    @grandma
  end

  def edit
  end
  
  def search
    @grandmas = Grandma.search(params[:query])
  end

  def create
    @grandma = Grandma.new(grandma_params)
    @grandma.user = current_user
    if @grandma.save!
      redirect_to grandma_path(@grandma)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @grandma = Grandma.find(params[:id])
    if @grandma.update(grandma_params)
      redirect_to @grandma, notice: 'Grandma was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @grandma = Grandma.find(params[:id])
    @grandma.destroy
    redirect_to grandmas_path
  end

  private

  def grandma_params
    params.require(:grandma).permit(:first_name, :last_name, :location, :skills, :price, :description, :image_url, feed_photos: [])
  end

  def set_grandma
    @grandma = Grandma.find(params[:id])
  end
end
