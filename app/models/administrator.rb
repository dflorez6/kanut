class Administrator < ApplicationRecord
  include DeviseInvitable::Inviter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable, # TODO: Uncomment to allow Administrator's sign up
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable

  #====================
  # Validations
  #====================
  # validates_presence_of :name, :email
  # validates_uniqueness_of :name, :email

  #====================
  # Associations
  #====================

  #====================
  # Scopes
  #====================
  default_scope { order(created_at: :asc) }

  #====================
  # Methods
  #====================

end
