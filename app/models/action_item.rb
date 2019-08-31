class ActionItem < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  belongs_to :recipient,
             :class_name => "User",
             :foreign_key => "actionee_id",
             :counter_cache => :received_follow_requests_count

  belongs_to :sender,
             :class_name => "User",
             :foreign_key => "assigner_id",
             :counter_cache => :sent_follow_requests_count

  # Indirect associations

  # Validations

  validates :actionee_id, :uniqueness => { :scope => [:assigner_id], :message => "already requested" }

  validates :actionee_id, :presence => true

  validates :assigner_id, :presence => true

end
