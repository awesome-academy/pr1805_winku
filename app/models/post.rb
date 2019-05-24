class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :place, optional: true

  validates :title, presence: true
  validates :category_id, presence: true
  validates :place_id, presence: true

  scope :newest, -> { order created_at: :desc }
end
