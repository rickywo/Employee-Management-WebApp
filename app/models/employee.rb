class Employee < ApplicationRecord
  belongs_to :capitalizable_group
  belongs_to :employment_type
  has_many :team_members
  has_many :teams, :through => :team_members
  has_many :iteration_attendances
  has_many :iterations, :through => :iteration_attendances
end
