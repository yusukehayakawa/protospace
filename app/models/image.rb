class Image < ActiveRecord::Base
  belongs_to :prototype, inverse_of: :images, dependent: :destroy

  mount_uploader :image, ImageUploader
  enum status: { main: 0, sub: 1 }

  validates :image, presence: true

end
