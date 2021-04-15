module API
  module V1
    class TeacherLanguages < Grape::API
      include API::V1::Defaults

      resource :teacher_languages do
        desc "Return all Teacher Languages"
        get "" do
          TeacherLanguage.all.includes(:photo)
        end
        desc "Return a Teacher Language"
        params do
          requires :id, type: String, desc: "ID of the teacher_language"
        end
        get ":id" do
          TeacherLanguage.where(id: permitted_params[:id]).first!.includes(:photo)
        end
      end
    end
  end
end
