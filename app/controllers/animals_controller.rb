class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
    if params[:page]
      @animals = Animal.all.page(params[:page])
    end
    @animals = Animal.paginate(page: params[:page], :per_page => 10)
    json_response(@animals)
  end

  def show
    @animal = Animal.find(params[:id])
    json_response(@animal)
  end

  def create
    @animal = Animal.create!(animal_params)
    json_response(@animal, :created)
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update!(animal_params)
      render status: 200, json: {
       message: "This animal has been updated successfully."
       }
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    if@animal.destroy!
      render status: 200, json: {
        message: "Animal deleted"
      }
    end
  end

  def random
    @animal = Animal.all.sample
    json_response(@animal)
  end

  def search
    @animals = Animal.search(params[:name])
    if params[:page]
      @animals = Animal.search(params[:name].page(params[:page]))
    end
    json_response(@animals)
  end

  def animal_params
    params.permit(:name, :age, :breed)
  end
end

