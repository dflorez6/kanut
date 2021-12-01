class Organization < ApplicationRecord
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

  #====================
  # Scopes
  #====================
  default_scope { order(name: :asc) }

  #====================
  # Methods
  #====================

end
