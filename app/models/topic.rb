class Topic < ApplicationRecord
  belongs_to :user
  	has_many :bookmarks, dependent: :destroy

  	validates :title, presence: true
  	validates :title, uniqueness: true
end
