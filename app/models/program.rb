class Program < ApplicationRecord
  # Direct associations

  has_many   :agile_teams,
             :dependent => :destroy

  belongs_to :program_manager,
             :class_name => "User"

  # Indirect associations

  # Validations

end
