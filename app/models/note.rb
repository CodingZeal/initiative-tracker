class Note < ApplicationRecord
  validates :body, presence: true, length: {minimum:5, maximum:100}

  scope :desc, -> {order("notes.created_at DESC")}

  belongs_to :initiative
  belongs_to :user
end
