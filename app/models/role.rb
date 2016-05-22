class Role < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { scope: :company }

  belongs_to :company
end
