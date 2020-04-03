class WritingsController < ApplicationController
  before_action :set_writing, only: [:show, :edit, :update, :destroy]

  # access all: [], site_admin: :all

  def index
    @writings = Writing.all
  end

  def show
  end

  def new
    @writing = Writing.new
    @grade_id = params[:grade_id]
  end

  def edit
    @grade_id = params[:grade_id]
  end

  def create
    @writing = Writing.new(writing_params)
    grade_id = @writing.grade_id

    respond_to do |format|
      if @writing.save
        create_writing_enrollments(@writing.id, grade_id)
        format.html { redirect_to grade_activities_path(grade_id: grade_id, writing: 1) }
      else
        format.html { redirect_to new_writing_path(grade_id: grade_id, messages: @writing.errors.messages) }
      end
    end
  end

  def update
    grade_id = @writing.grade_id

    respond_to do |format|
      if @writing.update(writing_params)
        format.html { redirect_to grade_activities_path(grade_id: grade_id, writing: 1) }
      else
        format.html { redirect_to grade_activities_path(grade_id: grade_id, writing: 1) }
      end
    end
  end

  def destroy
    @writing.destroy
    respond_to do |format|
      format.html { redirect_to writings_url, notice: 'Writing was successfully destroyed.' }
    end
  end

  def update_writing_enrollments
    grade_id = params[:grade_id]
    marks = params[:writing_enrollment][:marks].to_i
    id = params[:writing_enrollment][:id]

    writing_enrollment = WritingEnrollment.find(id)

    writing_enrollment.update_attributes(marks: marks)
    
    redirect_to grade_activities_path(grade_id: grade_id)
  end

  private
    
    def set_writing
      @writing = Writing.find(params[:id])
    end

    def writing_params
      params.require(:writing).permit(:title, :grade_id)
    end

    def create_writing_enrollments(writing_id, grade_id)
      grade = Grade.find(grade_id)

      grade.sections.each do |section|
        section.students.each do |student|
          WritingEnrollment.create(student_id: student.id, writing_id: writing_id)
        end 
      end
    end
end
