class Bookmark < ActiveRecord::Base
  belongs_to :topic
  has_one :user, through: :topic

  validates :url, presence: true
  validates :topic, presence: true
end
