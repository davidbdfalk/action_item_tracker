class BusinessUnit < ApplicationRecord
  # Direct associations

  belongs_to :director,
             :class_name => "User"

  # Indirect associations

  # Validations

end
