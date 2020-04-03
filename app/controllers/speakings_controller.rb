class SpeakingsController < ApplicationController
  before_action :set_speaking, only: [:show, :edit, :update, :destroy]

  # access all: [], site_admin: :all

  def index
    @speakings = Speaking.all
  end

  def show
  end

  def new
    @speaking = Speaking.new
    @grade_id = params[:grade_id]
  end

  def edit
    @grade_id = params[:grade_id]
  end

  def create
    @speaking = Speaking.new(speaking_params)
    grade_id = @speaking.grade_id

    respond_to do |format|
      if @speaking.save
        create_speaking_enrollments(@speaking.id, grade_id)
        format.html { redirect_to grade_activities_path(grade_id: grade_id) }
      else
        format.html { redirect_to new_speaking_path(grade_id: grade_id, messages: @speaking.errors.messages) }
      end
    end
  end

  def update
    grade_id = @speaking.grade_id

    respond_to do |format|
      if @speaking.update(speaking_params)
        format.html { redirect_to grade_activities_path(grade_id: grade_id) }
      else
        format.html { redirect_to grade_activities_path(grade_id: grade_id) }
      end
    end
  end

  def destroy
    @speaking.destroy
    respond_to do |format|
      format.html { redirect_to speakings_url, notice: 'Speaking was successfully destroyed.' }
    end
  end

  def update_speaking_enrollments
    grade_id = params[:grade_id]
    marks = params[:speaking_enrollment][:marks].to_i
    id = params[:speaking_enrollment][:id]

    speaking_enrollment = SpeakingEnrollment.find(id)

    speaking_enrollment.update_attributes(marks: marks)
    
    redirect_to grade_activities_path(grade_id: grade_id)  
  end

  private

    def set_speaking
      @speaking = Speaking.find(params[:id])
    end

    def speaking_params
      params.require(:speaking).permit(:title, :grade_id)
    end

    def create_speaking_enrollments(speaking_id, grade_id)
      grade = Grade.find(grade_id)

      grade.sections.each do |section|
        section.students.each do |student|
          SpeakingEnrollment.create(student_id: student.id, speaking_id: speaking_id)
        end 
      end
    end
end
