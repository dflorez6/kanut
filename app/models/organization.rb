class Organization < ApplicationRecord
  include DeviseInvitable::Inviter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #====================
  # Validations
  #====================
  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email

  #====================
  # Associations
  #====================
  has_many :users

  #====================
  # Scopes
  #====================
  default_scope { order(name: :asc) }

  #====================
  # Methods
  #====================

end
