class GrandmasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_grandma, only: [:show, :edit, :update, :destroy]

  def index
    @grandmas = Grandma.all
  end

  def new
    @grandma = Grandma.new
  end

  def show
    @grandma = Grandma.find(params[:id])
    end

  def edit
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
    if @grandma.update(grandma_params)
      redirect_to @grandma
    else
      render :edit
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
    @grandma.destroy
    # redirection path tbd
  end

  private

  def grandma_params
    params.require(:grandma).permit(:first_name, :last_name, :location, :skills, :price, :description, :image_url, feed_photos: [])
  end

  def set_grandma
    @grandma = Grandma.find(params[:id])
  end


end
