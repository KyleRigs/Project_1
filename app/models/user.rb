# app/models/user.rb
class User < ApplicationRecord
  # Devise modules...
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # User can have many tasks
  has_many :tasks, dependent: :destroy
end
