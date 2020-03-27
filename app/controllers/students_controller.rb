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

    grade = Grade.find(grade_id)

    respond_to do |format|
      if @student.save
        create_enrollments(grade, @student.id) if exist_activity?(grade)
        format.html { redirect_to section_path(grade_id: grade_id, id: section_id), notice: 'Student was successfully created.' }
      else
        format.html { redirect_to new_student_path(grade_id: grade_id, id: section_id, messages: @student.errors.messages) }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_show_path(grade_id: @grade_id, id: @section_id, student_id: @student.id), notice: 'Student was successfully updated.' }
      else
        format.html { redirect_to edit_student_path(grade_id: @grade_id, id: @section_id, student_id: @student.id, messages: @student.errors.messages) }
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
      params.require(:student).permit(:name,
                                      :age,
                                      :profile_image,
                                      :family_history,
                                      :strengths,
                                      :weaknesses,
                                      :disabilities,
                                      :section_id)
    end

    def create_enrollments(grade, student_id)
      create_speaking_enrollments(grade.speakings, student_id) if !grade.speakings.empty?
      create_writing_enrollments(grade.writings, student_id) if !grade.writings.empty?
      create_reading_enrollments(grade.readings, student_id) if !grade.readings.empty?
      create_listening_enrollments(grade.listenings, student_id) if !grade.listenings.empty?
    end

    def create_speaking_enrollments(speakings, student_id)
      speakings.each do |speaking|
        SpeakingEnrollment.create(speaking_id: speaking.id, student_id: student_id)
      end
    end

    def create_writing_enrollments(writings, student_id)
      writings.each do |writing|
        WritingEnrollment.create(writing_id: writing.id, student_id: student_id)
      end
    end

    def create_reading_enrollments(readings, student_id)
      readings.each do |reading|
        ReadingEnrollment.create(reading_id: reading.id, student_id: student_id)
      end
    end

    def create_listening_enrollments(listenings, student_id)
      listenings.each do |listening|
        ListeningEnrollment.create(listening_id: listening.id, student_id: student_id)
      end
    end

    def exist_activity?(grade)
      !grade.speakings.empty? || 
      !grade.writings.empty? ||
      !grade.readings.empty? ||
      !grade.listenings.empty?
    end
end
