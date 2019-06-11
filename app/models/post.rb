class Post < ApplicationRecord
  before_create :set_default_status, :if => :new_record?

  belongs_to :user
  belongs_to :place, optional: true
  has_one :image, as: :imageable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  accepts_nested_attributes_for :image, reject_if: proc {|attributes|
    attributes['image_link'].blank?}

  enum status: { block: 1, unblock: 2 }
  scope :newest, -> { order created_at: :desc }

  def set_default_status
    self.status ||= :unblock
  end
end
