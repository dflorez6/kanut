class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #====================
  # Validations
  #====================
  validates_presence_of :email
  validates_uniqueness_of :email

  #====================
  # Associations
  #====================

  #====================
  # Scopes
  #====================
  default_scope { order(email: :asc) }

  #====================
  # Methods
  #====================

end
