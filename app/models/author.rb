class Author < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments
  authenticates_with_sorcery!
  validates_confirmation_of :password, if: :password, message: "didn't match password"
  validates :username, :password, :email, :password_confirmation, presence: true
  validates :username, :email, uniqueness: true
  
end
