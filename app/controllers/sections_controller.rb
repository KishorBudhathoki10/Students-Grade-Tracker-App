class SectionsController < ApplicationController
  def show
    @section = Section.find(params[:id])
    @students = @section.students
    @id = @section.id
    @grade_id = params[:grade_id]
  end
end