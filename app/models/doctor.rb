class Doctor < ActiveRecord::Base
  has_many :patients, inverse_of: :doctor
  default_scope ->{where(deleted_at: nil)}
  validates :first_name, :last_name, :patronymic, :dob, :phone, presence: true

  def full_name
    "#{last_name} #{first_name}"
  end

  def archive!
    update_column(:deleted_at, Time.current)
  end
end
