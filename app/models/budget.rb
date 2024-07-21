class Budget < ApplicationRecord
  belongs_to :user

  validates :name, :amount, :start_date, :end_date, :recurring, presence: true
end
