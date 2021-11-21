class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #====================
  # Validations
  #====================


  #====================
  # Associations
  #====================

  #====================
  # Scopes
  #====================
  default_scope { order(last_name: :asc) }

  #====================
  # Methods
  #====================

end
