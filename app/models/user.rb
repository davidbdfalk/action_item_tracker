class User < ApplicationRecord
  # Direct associations

  has_many   :operating_units,
             :foreign_key => "vice_president_id",
             :dependent => :nullify

  has_many   :received_follow_requests,
             :class_name => "ActionItem",
             :foreign_key => "actionee_id",
             :dependent => :destroy

  has_many   :sent_follow_requests,
             :class_name => "ActionItem",
             :foreign_key => "assigner_id",
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
