class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :orders

  validates :email, uniqueness: true
end
