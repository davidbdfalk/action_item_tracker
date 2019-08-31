class ActionItem < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :actionee_id, :uniqueness => { :scope => [:assigner_id], :message => "already requested" }

  validates :actionee_id, :presence => true

  validates :assigner_id, :presence => true

end
