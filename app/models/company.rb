class Company < ActiveRecord::Base
  validates :social_reason, :fantasy_name, :cnpj, presence: true
  validates :cnpj, uniqueness: true
  validates :cnpj, cnpj: true

  belongs_to :manager
  has_many :roles, dependent: :destroy
  has_many :workers, dependent: :destroy
  has_many :periods, dependent: :destroy
  has_many :frequencies, dependent: :destroy
end
