class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable

  #====================
  # Validations
  #====================
  validates_presence_of :email
  validates_uniqueness_of :email

  #====================
  # Associations
  #====================
  has_many :invitees, class_name: 'User', foreign_key: :invited_by_id
  belongs_to :organization, optional: true

  #====================
  # Scopes
  #====================
  default_scope { order(last_name: :asc) }

  #====================
  # Methods
  #====================

end
