class Prototype < ActiveRecord::Base

  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates_associated :images, presence: true
  validates :name, :catch_copy, :concept, presence: true
  accepts_nested_attributes_for :images, limit: 4, reject_if: proc { |attributes| attributes[:image].blank? }
  acts_as_taggable

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

end
