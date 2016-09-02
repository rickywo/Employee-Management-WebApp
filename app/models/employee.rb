class Employee < ApplicationRecord
  belongs_to :capitalizable_group
  has_many :team_members
  has_many :teams, :through => :team_members
  has_many :iteration_attendances
  has_many :iterations, :through => :iteration_attendances
end
