class Post < ApplicationRecord
  belongs_to :author,
    class_name: "User",
    foreign_key: "user_id",
    dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  after_create_commit do
    Rails.logger.info("AFTER CREATE COMMIT - Broadcast Update to")
    broadcast_update_to(
      "teststr",
      target: "broadcasts",
      html: <<-HTML
        <div style="background-color: green">
          <h5>AFTER CREATE COMMIT Broadcast</h5>
          <p>Post #{title} was created</p>
        </div>
      HTML
    )
  end

  after_update_commit do
    Rails.logger.info("AFTER UPDATE COMMIT - Broadcast Prepend to")
    broadcast_prepend_to(
      "teststr",
      target: "broadcasts",
      html: <<-HTML
        <div style="background-color: blue">
          <h5>AFTER UPDATE COMMIT Broadcast</h5>
          <p>Changed title to #{title}</p>
        </div>
      HTML
    )
  end

  private

  def eql?(other)
    other.class == self.class &&
      other.id == id
  end
end
