class Bookmark < ActiveRecord::Base
  belongs_to :topic

  validates :url, presence: true
  validates :topic, presence: true
end
