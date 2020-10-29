class Kelompok < ApplicationRecord
  belongs_to :desa
  
  has_many :people

  validates_presence_of :name, :desa
end
