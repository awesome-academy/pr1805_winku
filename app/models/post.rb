class Post < ApplicationRecord
  belongs_to :user
  belongs_to :place, optional: true
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, reject_if: proc {|attributes|
    attributes['image_link'].blank?}

  scope :newest, -> { order created_at: :desc }
end
