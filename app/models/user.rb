class User < ApplicationRecord
has_secure_password
validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email'}
has_many :posts, dependent: :destroy
has_many :comments, dependent: :destroy
 has_many :likes, as: :likeable
# has_one_attached :avatar

# enum role: [:super_admin, :admin, :user]
# enum :role, {admin: 1, super_admin: 2, user: 3}
# enum :role, { 1 => "admin", 2 => "super_admin", 3 => "user"}
end
