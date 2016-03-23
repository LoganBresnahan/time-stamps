class Stamp < ActiveRecord::Base
  validates :note_id, presence: true

  belongs_to :notes
end
