class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :place, optional: true

  scope :newest, -> { order created_at: :desc }
end
