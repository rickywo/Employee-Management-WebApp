class Team < ApplicationRecord
  belongs_to :iteration
  has_many :projects
  has_many :team_members
  has_many :employees, :through => :team_members
end
