class BusinessUnit < ApplicationRecord
  # Direct associations

  belongs_to :operating_unit,
             :counter_cache => true

  has_many   :programs,
             :dependent => :destroy

  belongs_to :director,
             :class_name => "User"

  # Indirect associations

  # Validations

end
