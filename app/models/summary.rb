class Summary < ApplicationRecord
  include Abyme::Model
  
  has_many :words
  accepts_nested_attributes_for :words

  has_many :mistakes
  # accepts_nested_attributes_for :mistakes
  abymize :mistakes, permit: [:wrong_content, :correct_content]

  belongs_to :course

  validates :title, presence: true
end
