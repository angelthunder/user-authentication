class Post < ApplicationRecord
  belongs_to :author,
    class_name: "User",
    foreign_key: "user_id",
    dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  private

  def eql?(other)
    other.class == self.class &&
      other.id == id
  end
end
