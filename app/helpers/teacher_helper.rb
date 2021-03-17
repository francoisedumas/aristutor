module TeacherHelper
  def teacher_img(current_teacher)
    if current_teacher.photo.attached?
      cl_image_tag current_teacher.photo.key, class: "small-avatar"
    else
      image_tag 'default-avatar.png', class: "small-avatar"
    end
  end
end
