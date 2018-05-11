class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :videos

  validates_presence_of :email, :password
  validates_uniqueness_of :email
end
