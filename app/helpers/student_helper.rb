module StudentHelper
  def student_img(student, css_class)
    if student && student.photo.attached?
      cl_image_tag student.photo.key, class: css_class
    else
      image_tag 'default-avatar.png', class: css_class
    end
  end
end
