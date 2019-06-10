class Post < ApplicationRecord
  belongs_to :user
  belongs_to :place, optional: true
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, reject_if: proc {|attributes|
    attributes['image_link'].blank?}
  enum status: { block: 1, unblock: 2 }
  before_create :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :unblock
  end

  scope :newest, -> { order created_at: :desc }
  has_many :comments, as: :commentable, dependent: :destroy
end
