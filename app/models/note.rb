class Note < ApplicationRecord

  validates :body, presence: true, length: {minimum:5, maximum:100}

  belongs_to :initiative
  belongs_to :user
end
