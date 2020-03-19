class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit]
  before_action :set_student_id_section_id_grade_id, only: [:destroy, :update]

  def show
    @id = params[:id]
    @student_id = params[:student_id]
    @grade_id = params[:grade_id]
  end

  def new
    @student = Student.new
    @section_id = params[:id]
    @grade_id = params[:grade_id]
  end

  def edit
    @section_id = params[:id]
    @grade_id = params[:grade_id]
  end

  def create
    @student = Student.new(student_params)
    section_id = @student.section_id

    grade_id = params[:student][:grade_id]  

    respond_to do |format|
      if @student.save
        format.html { redirect_to "/grades/#{grade_id}/sections/#{section_id}", notice: 'Student was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to "/grades/#{@grade_id}/sections/#{@section_id}", notice: 'Student was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    
    @student.destroy
    respond_to do |format|
      format.html { redirect_to "/grades/#{@grade_id}/sections/#{@section_id}", notice: 'Student was successfully destroyed.' }
    end
  end

  private

    def set_student_id_section_id_grade_id
      @student = Student.find(params[:id])
      @section_id = @student.section_id
      
      @grade_id = @student.section.grade_id
    end
 
    def set_student
      @student = Student.find(params[:student_id])
    end

    def student_params
      params.require(:student).permit(:name, :age, :family_history, :strengths, :weaknesses, :disabilities, :section_id)
    end
end
