class Patient < ActiveRecord::Base
  validates :first_name, :last_name, :patronymic, :dob, :email, :phone, presence: true
  validates :email, :phone, uniqueness: true
end
