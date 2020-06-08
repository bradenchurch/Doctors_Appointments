class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  validates :date, :type, presence: true
end
