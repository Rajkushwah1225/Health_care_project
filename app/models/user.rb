class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  has_many :patients, dependent: :destroy # If a user is deleted, their patients are too.
end