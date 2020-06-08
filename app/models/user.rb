class User < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
  validates :full_name, presence: true
  validates :age, presence: true
  validates :gender, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end

