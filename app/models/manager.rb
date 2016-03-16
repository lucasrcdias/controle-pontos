class Manager < ActiveRecord::Base
  belongs_to :user
  has_one :company, dependent: :destroy
end
