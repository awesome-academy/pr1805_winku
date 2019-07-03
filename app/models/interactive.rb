class Interactive < ApplicationRecord
  belongs_to :user, class_name: User.name, foreign_key: :active_id
  belongs_to :post, class_name: Post.name, foreign_key: :passive_id

  enum action: { like: 1, view: 2, follow: 3 }

  scope :interactive_view, -> (active_id, passive_id){ where("active_id = ? and passive_id = ? and action = 2", active_id, passive_id) }
  scope :interactive_like, -> (active_id, passive_id){ where("active_id = ? and passive_id = ? and action = 1", active_id, passive_id) }
end
