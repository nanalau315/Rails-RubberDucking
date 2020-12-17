class DucksController < ApplicationController
  # ducks[:index, :show, :new, :create, :edit, :update]
 
  def index
    @ducks = Duck.all
  end

  def show
    @duck = Duck.find(params[:id])
  end

  def new
    @duck = Duck.new
    @students = Student.all
  end

  def create
    @duck = Duck.create(duck_params(:name, :description, :student_id))
    if @duck.valid?
      redirect_to duck_path(@duck)
    else
      flash[:errors] = @duck.errors.full_messages
      redirect_to new_duck_path
    end
  end

  def edit
    @duck = Duck.find(params[:id])
  end

  def update
    @duck = Duck.find(params[:id])
    if @duck.update(duck_params(:name, :description, :student_id))
      redirect_to duck_path(@duck)
    else
      flash[:errors] = @duck.errors.full_messages
      redirect_to edit_duck_path
    end
  end

  private
  def duck_params(*args)
    params.require(:duck).permit(*args)
  end
end
