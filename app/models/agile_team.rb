class AgileTeam < ApplicationRecord
  # Direct associations

  belongs_to :program,
             :counter_cache => true

  belongs_to :scrum_master,
             :class_name => "User"

  # Indirect associations

  # Validations

end
