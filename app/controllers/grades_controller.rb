class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  access all: [], site_admin: :all

  def index
    @grades = Grade.sorted
  end

  def show
    @sections = @grade.sections
  end

  def new
    @grade = Grade.new
  end

  def edit
  end

  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to grades_path, notice: 'Grade was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
    end
  end

  def activities
    @grade = Grade.find(params[:grade_id])
    @speakings = @grade.speakings.newest_first
    @writings = @grade.writings.newest_first
    @listenings = @grade.listenings.newest_first
    @readings = @grade.readings.newest_first
    @sections = @grade.sections.alphabetically
    puts "*" * 40
    p @sections
    puts "*" * 40
  end

  def speakings
    @grade = Grade.find(params[:grade_id])
    @speakings = @grade.speakings.newest_first
    @sections = @grade.sections.alphabetically
  end

  private
    
    def set_grade
      @grade = Grade.find(params[:id])
    end

    def grade_params
      params.require(:grade).permit(:name,
                                    :thumb_image,
                                    sections_attributes: [:id, :name, :thumb_image, :_destroy])
    end
end
