class Project < ApplicationRecord
  belongs_to :team
  belongs_to :iteration
end
