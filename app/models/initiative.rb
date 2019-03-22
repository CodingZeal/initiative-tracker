# frozen_string_literal: true

class Initiative < ApplicationRecord
  validates :title, presence: true
  validates :target_date, presence: true

  scope :completed, -> {where(completion: true)}
  scope :incompleted, -> {where(completion: false)}
end
