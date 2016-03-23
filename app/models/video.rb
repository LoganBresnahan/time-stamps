class Video < ActiveRecord::Base
  validates :title, presence: true
  validates :link, presence: true

  belongs_to :notes
end
