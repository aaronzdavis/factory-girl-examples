class User < ActiveRecord::Base

  has_many :posts

  validates :username, presence: true, uniqueness: true

  def is_underage?
    date_of_birth > 21.years.ago
  end

  def power_user?
    posts.count >= 1000
  end

  def inactive?
    posts.last.created_at < 30.days.ago
  end

end
