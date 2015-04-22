class Clinic < ActiveRecord::Base
  has_many :patients, inverse_of: :clinic
end
