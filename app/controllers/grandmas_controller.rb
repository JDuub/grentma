class GrandmasController < ApplicationController
  before_action :set_grandma, only: [:show, :edit, :update, :destroy]

  def index
    @grandmas = Grandma.all
  end

  def new
    @grandma = Grandma.new
  end

  def show
  end

  def edit
  end

  def create
    @grandma = Grandma.new(grandma_params)
    if @grandma.save
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

  def destroy
    @grandma.destroy
    # redirection path tbd
  end

  private

  def grandma_params
    params.require(:grandma).permit(:first_name, :last_name, :location, :skills, :description, :image_url)
  end

  def set_grandma
    @grandma = Grandma.find(params[:id])
  end
end
