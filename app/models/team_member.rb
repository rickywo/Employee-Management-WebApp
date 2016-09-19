class TeamMember < ApplicationRecord
  belongs_to :iteration
  belongs_to :team
  belongs_to :employee
end
