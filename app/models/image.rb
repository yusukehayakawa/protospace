class Image < ActiveRecord::Base
  belongs_to :prototype, dependent: :destroy

  mount_uploader :image, ImageUploader
  enum status: [ :main, :sub ]

  validates :image, presence: true
end
