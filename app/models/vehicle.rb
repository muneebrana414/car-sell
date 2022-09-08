class Vehicle < ApplicationRecord

  enum transmission: [:automatic, :manual]
  enum assembly_type: [:local, :import]
end
