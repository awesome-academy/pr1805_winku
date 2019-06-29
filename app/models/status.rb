class Status < Post
  scope :newest, -> { order created_at: :desc }
  scope :unblock, -> { where status: :unblock}
end
