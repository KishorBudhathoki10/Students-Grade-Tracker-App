class SectionsController < ApplicationController

  access all: [], site_admin: :all

  def show
    @section = Section.find(params[:id])
    @students = order_students(params[:sort_by], @section.students)
    @id = @section.id
    @grade_id = params[:grade_id]
  end

  private

  def order_students(order, students)
    if order == "newest"
      students.newest_first
    else
      students.alphabetically
    end
  end
end