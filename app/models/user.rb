class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  def bookmarks_created
  	bookmarks.includes(:topic)
  end
end