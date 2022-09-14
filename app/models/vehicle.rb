class Vehicle < ApplicationRecord
  acts_as_favoritable
  
  belongs_to :user
  enum transmission: [:automatic, :manual]
  enum assembly_type: [:local, :import]

  has_many_attached :pictures
end
