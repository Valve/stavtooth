class Visit < ActiveRecord::Base
  belongs_to :patient, inverse_of: :visits
  belongs_to :doctor

  validates :patient, :doctor, :diagnosis, presence: true
end
