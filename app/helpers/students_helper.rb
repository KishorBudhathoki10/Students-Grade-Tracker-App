module StudentsHelper
  def set_student_image(student)
    if student.profile_image?
      student.profile_image
    else
      "https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_1280.png"
    end
  end
end
