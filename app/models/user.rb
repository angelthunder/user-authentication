class User < ApplicationRecord
  has_many :posts

  validates :email, presence: true
  validates :password, presence: true

  def eql?(other)
    other.is_a?(self.class) && other.id == id
  end
end
