class Tour < Post
  scope :newest, -> { order created_at: :desc }
end
