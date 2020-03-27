class ListeningsController < ApplicationController
  before_action :set_listening, only: [:show, :edit, :update, :destroy]

  def index
    @listenings = Listening.all
  end

  def show
  end

  def new
    @listening = Listening.new
    @grade_id = params[:grade_id]
  end

  def edit
    @grade_id = params[:grade_id]
  end

  def create
    @listening = Listening.new(listening_params)
    grade_id = @listening.grade_id

    respond_to do |format|
      if @listening.save
        create_listening_enrollments(@listening.id, grade_id)
        format.html { redirect_to grade_activities_path(grade_id: grade_id, listening: 1) }
      else
        format.html { redirect_to new_listening_path(grade_id: grade_id, messages: @listening.errors.messages) }
      end
    end
  end

  def update
    grade_id = @listening.grade_id

    respond_to do |format|
      if @listening.update(listening_params)
        format.html { redirect_to grade_activities_path(grade_id: grade_id, listening: 1) }
      else
        format.html { redirect_to grade_activities_path(grade_id: grade_id, listening: 1) }
      end
    end
  end

  def destroy
    @listening.destroy
    respond_to do |format|
      format.html { redirect_to listenings_url, notice: 'Listening was successfully destroyed.' }
    end
  end

  def update_listening_enrollments
    grade_id = params[:grade_id]
    marks = params[:listening_enrollment][:marks].to_i
    id = params[:listening_enrollment][:id]

    listening_enrollment = ListeningEnrollment.find(id)

    listening_enrollment.update_attributes(marks: marks)
      
    redirect_to grade_activities_path(grade_id: grade_id)
  end

  private

    def set_listening
      @listening = Listening.find(params[:id])
    end

    def listening_params
      params.require(:listening).permit(:title, :grade_id)
    end

    def create_listening_enrollments(listening_id, grade_id)
      grade = Grade.find(grade_id)

      grade.sections.each do |section|
        section.students.each do |student|
          ListeningEnrollment.create(student_id: student.id, listening_id: listening_id)
        end
      end
    end
end
