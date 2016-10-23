class Prototype < ActiveRecord::Base

  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates_associated :images
  validates :name, :catch_copy, :concept, presence: true
  accepts_nested_attributes_for :images, reject_if: proc { |attribute| attribute[:image].blank? }

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

end
