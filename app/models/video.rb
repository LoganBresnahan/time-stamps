class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :url, presence: true

  belongs_to :notes
end
