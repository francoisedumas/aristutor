class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :teacher_languages
  has_many :courses

  validates :first_name, :last_name, : presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
