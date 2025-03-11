class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :patient
  belongs_to :report

  validates :start_date, :end_date, :summary, presence: true
  validates :start_date, comparison: { less_than: :end_date }
end
