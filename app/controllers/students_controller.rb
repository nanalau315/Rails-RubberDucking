class StudentsController < ApplicationController
 
  # students [:index, :show, :new, :create, :edit, :update]
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params(:name, :mod))
    if @student.valid?
      redirect_to student_path(@student)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    if @student.update(student_params(:name, :mod))
      redirect_to student_path(@student)
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to edit_student_path(@student)
    end
  end

  private
  def student_params(*args)
    params.require(:student).permit(*args)
  end

end
