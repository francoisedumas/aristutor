class StudentSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :phone_number, :mother_language
end
