class Status < Post
  scope :newest, -> { order created_at: :desc }
  scope :unblock, -> { where status: :unblock}

  has_many :interactives, class_name: Interactive.name, foreign_key: :passive_id
end
