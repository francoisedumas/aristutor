module StudentHelper
  def student_img(student)
    if student && student.photo.attached?
      cl_image_tag student.photo.key, class:'small-avatar'
    else
      image_tag 'default-avatar.png', class: "small-avatar"
    end
  end
end
