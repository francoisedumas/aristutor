class Summary < ApplicationRecord

  has_many :words
  has_many :mistakes

  belongs_to :course

  validates :title, presence: true
end
