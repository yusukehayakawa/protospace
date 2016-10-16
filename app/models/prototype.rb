class Prototype < ActiveRecord::Base

  belongs_to :user
  has_many :images, dependent: :destroy
  validates_associated :images
  validates :name, :catch_copy, :concept, presence: true
  accepts_nested_attributes_for :images, reject_if: proc { |attribute| attribute[:image].blank? }



end
