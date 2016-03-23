class Note < ActiveRecord::Base
  validates :title, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :videos, dependent: :destroy
  has_many :stamps, dependent: :destroy
end
