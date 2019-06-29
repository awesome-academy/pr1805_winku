class Tour < Post
  scope :newest, -> { order created_at: :desc }

  validates :place, length: {minimum: 10, maximum: 500}, allow_nil: false
  validates :vehicle, length: {minimum: 10, maximum: 50}, allow_nil: false
  validates :cost, length: {minimun: 1, maximum: 10}, allow_nil: false
  validates :time, length: {maximum: 50}
end
