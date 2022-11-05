class Vehicle < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:price, :milage, :engine_capacity, :model, :city, :color, :transmission, :engine_type, :assembly_type]
  cattr_accessor :form_steps do
    %w(details images contacts)
  end

  attr_accessor :form_step

  acts_as_favoritable
  
  belongs_to :user
  enum transmission: [:automatic, :manual]
  enum assembly_type: [:local, :import]

  has_many_attached :pictures

  validates :price, :milage, :engine_capacity,  
            :city, :engine_type, :assembly_type, 
            :model, :currency, :color, :transmission, presence: true, if: -> { required_for_step?(:details) }
  validates :pictures,  presence: true, if: -> { required_for_step?(:images) }
  validates :primary_contact, presence: true, if: -> { required_for_step?(:contacts) }

  def required_for_step?(step)
    return true if form_step.nil?
    return true if self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
  end
end
