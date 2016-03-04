class Article < ActiveRecord::Base
  validates :title, presence: true
  mount_uploader :photo, PhotoUploader

  has_many :comments, dependent: :destroy
end
