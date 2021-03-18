module TeacherHelper
  def teacher_img(current_teacher)
    if current_teacher.photo.attached?
      cl_image_tag current_teacher.photo.key, class: "large-avatar"
    else
      image_tag 'default-avatar.png', class: "large-avatar"
    end
  end
end
