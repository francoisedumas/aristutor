class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  LANGUAGES = %w[FR EN ES PT]

  has_many :courses

  validates :first_name, :last_name, :phone_number, :mother_language, :presence true
  validates :phone_number, :uniqueness true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
