class Employee < ApplicationRecord
  belongs_to :capitalizable_group
  belongs_to :attendance_type
  belongs_to :iteration
  has_many :team_members
  has_many :teams, :through => :team_members
end
