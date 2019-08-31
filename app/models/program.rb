class Program < ApplicationRecord
  # Direct associations

  belongs_to :program_manager,
             :class_name => "User"

  # Indirect associations

  # Validations

end
