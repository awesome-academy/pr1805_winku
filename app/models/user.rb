class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  belongs_to :business, optional: true
  mount_uploader :avatar, AvatarUploader
  validate :avatar_size

  def avatar_size
    if (avatar.size) > 5.megabytes
     errors.add(:avatar, "should be less than 5MB")
    end
  end
end
