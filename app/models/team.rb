class Team < ApplicationRecord
  has_many :projects
  has_many :team_members
  has_many :employees, :through => :teammembers
end
