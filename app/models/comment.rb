class Comment < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :action_item_id, :presence => true

  validates :body, :presence => true

  validates :commenter_id, :presence => true

end
