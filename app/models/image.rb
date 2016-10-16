class Image < ActiveRecord::Base
  belongs_to :prototype, dependent: :destroy

  mount_uploader :image, ImageUploader
  enum status: { main: 0, sub: 1 }

  validates :image, presence: true

end
