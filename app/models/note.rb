class Note < Application::Base
  validates :title, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :videos
  has_many :timestamps
end
