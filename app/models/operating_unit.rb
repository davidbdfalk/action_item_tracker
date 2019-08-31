class OperatingUnit < ApplicationRecord
  # Direct associations

  has_many   :business_units,
             :dependent => :destroy

  belongs_to :vice_president,
             :class_name => "User"

  # Indirect associations

  # Validations

end
