class Desa < ApplicationRecord
  has_many :kelompoks
  has_many :people, through: :kelompoks

  validates_presence_of :name
end
