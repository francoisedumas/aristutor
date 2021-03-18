module StudentHelper
  def student_img(student, class)
    if student && student.photo.attached?
      cl_image_tag student.photo.key, class: class
    else
      image_tag 'default-avatar.png', class: class
    end
  end
end
