class Scoresheet < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :teamnumber, presence: true
end
