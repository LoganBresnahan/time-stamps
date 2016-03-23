class User < ActiveRecord::Base
   validates :username, presence: true
   validates :email, presence: true, uniqueness: true
   has_secure_password

   has_many :notes
   has_many :videos, through: :notes
   has_many :time_stamps, through: :notes
end
