class Place < ApplicationRecord
  before_save { self.name = name.upcase }

  has_many :posts
  has_one :image, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :image, reject_if: proc {|attributes|
    attributes['image_link'].blank?}

  validates :name, presence: true , uniqueness: true

  scope :newest, -> { order created_at: :desc }
end
