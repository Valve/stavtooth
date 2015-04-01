class Patient < ActiveRecord::Base
  belongs_to :doctor, inverse_of: :patients
  has_many :visits, inverse_of: :patient

  default_scope ->{where(deleted_at: nil)}
  validates :first_name, :last_name, :patronymic, :dob, :phone, :doctor, presence: true

  def full_name
    "#{last_name} #{first_name}"
  end

  def archive!
    update_column(:deleted_at, Time.current)
  end

end
