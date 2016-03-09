class Frequency < ActiveRecord::Base
  validates_with FrequencyValidator
  belongs_to :company
end
