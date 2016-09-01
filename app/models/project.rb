class Project < ApplicationRecord
  belongs_to :team
  has_many :project_iterations
  has_many :iterations, :through => :project_iterations
end
