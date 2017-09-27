class Group < ApplicationRecord
  #validates :title, presence: true
  validates_presence_of :title, :description


  belongs_to :user
  has_many :posts 

end
