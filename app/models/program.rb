class Program < ApplicationRecord
  # Direct associations

  belongs_to :business_unit,
             :counter_cache => true

  has_many   :agile_teams,
             :dependent => :destroy

  belongs_to :program_manager,
             :class_name => "User"

  # Indirect associations

  # Validations

end
