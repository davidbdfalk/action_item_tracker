class BusinessUnit < ApplicationRecord
  # Direct associations

  has_many   :programs,
             :dependent => :destroy

  belongs_to :director,
             :class_name => "User"

  # Indirect associations

  # Validations

end
