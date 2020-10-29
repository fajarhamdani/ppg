class Role < ApplicationRecord
  has_and_belongs_to_many :users

  ROLE_LIST = [:super_admin, :daerah, :desa, :kelompok].freeze
end
