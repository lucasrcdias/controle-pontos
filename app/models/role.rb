class Role < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { scope: :company }

  belongs_to :company

  alias_attribute :to_s, :name
end
