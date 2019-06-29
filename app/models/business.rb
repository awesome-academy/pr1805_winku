class Business < ApplicationRecord
  belongs_to :user
  after_create_commit :perform

  scope :not_opened, -> { where opened_at: nil}

end
