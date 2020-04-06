class SectionsController < ApplicationController

  # access all: [], site_admin: :all

  def show
    @section = Section.find(params[:id])
    @students = @section.students.alphabetically
    @id = @section.id
    @grade_id = params[:grade_id]
  end
end