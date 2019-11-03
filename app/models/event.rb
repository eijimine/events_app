class Event < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :speakers, class_name: "User", foreign_key: "user_id"
end
