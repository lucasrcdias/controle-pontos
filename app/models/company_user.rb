class CompanyUser < ActiveRecord::Base
  extend EnumerateIt

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true

  has_one :company, dependent: :destroy
end
