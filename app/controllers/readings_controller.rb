class ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :edit, :update, :destroy]

  # access all: [], site_admin: :all

  def index
    @readings = Reading.all
  end

  def show
  end

  def new
    @reading = Reading.new
    @grade_id = params[:grade_id]
  end

  def edit
    @grade_id = params[:grade_id]
  end

  def create
    @reading = Reading.new(reading_params)
    grade_id = @reading.grade_id

    respond_to do |format|
      if @reading.save
        create_reading_enrollments(@reading.id, grade_id)
        format.html { redirect_to grade_activities_path(grade_id: grade_id, reading: 1) }
      else
        format.html { redirect_to new_reading_path(grade_id: grade_id, messages: @reading.errors.messages) }
      end
    end
  end

  def update
    grade_id = @reading.grade_id

    respond_to do |format|
      if @reading.update(reading_params)
        format.html { redirect_to grade_activities_path(grade_id: grade_id, reading: 1) }
      else
        format.html { redirect_to grade_activities_path(grade_id: grade_id, reading: 1) }
      end
    end
  end

  def destroy
    @reading.destroy
    respond_to do |format|
      format.html { redirect_to readings_url, notice: 'Reading was successfully destroyed.' }
    end
  end

  def update_reading_enrollments
    grade_id = params[:grade_id]
    marks = params[:reading_enrollment][:marks].to_i
    id = params[:reading_enrollment][:id]

    reading_enrollment = ReadingEnrollment.find(id)

    reading_enrollment.update_attributes(marks: marks)

    redirect_to grade_activities_path(grade_id: grade_id)
  end

  private

    def set_reading
      @reading = Reading.find(params[:id])
    end

    def reading_params
      params.require(:reading).permit(:title, :grade_id)
    end

    def create_reading_enrollments(reading_id, grade_id)
      grade = Grade.find(grade_id)

      grade.sections.each do |section|
        section.students.each do |student|
          ReadingEnrollment.create(student_id: student.id, reading_id: reading_id)
        end
      end
    end
end
