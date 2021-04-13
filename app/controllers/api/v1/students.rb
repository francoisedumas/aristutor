module API
  module V1
    class Students < Grape::API
      include API::V1::Defaults
      resource :students do
        desc "Return all Students"
        get "" do
          Student.all
        end
        desc "Return a Student"
        params do
          requires :id, type: String, desc: "ID of the student"
        end
        get ":id" do
          Student.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end
