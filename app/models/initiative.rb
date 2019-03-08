class Initiative < ApplicationRecord
  validates :title, presence: true
  validates :target_date, presence: true
  
  belongs_to :user
end
