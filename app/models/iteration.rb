class Iteration < ApplicationRecord
  has_many :project_iterations
  has_many :projects, :through => :project_iterations
  has_many :iteration_attendances
  has_many :employees, :through => :iteration_attendances
end
