class OperatingUnit < ApplicationRecord
  # Direct associations

  belongs_to :vice_president,
             :class_name => "User"

  # Indirect associations

  # Validations

end
