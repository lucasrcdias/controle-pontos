class Company < ActiveRecord::Base
  validates :social_reason, :fantasy_name, :cnpj, presence: true
  validates :cnpj, :code, uniqueness: true

  belongs_to :company_user
  has_many :roles, dependent: :destroy
  has_many :frequencies, dependent: :destroy

  scope :with_code, ->(code) { where(code: code) }

  before_create :generate_code

  private

  def generate_code
    self.code = CompanyCodeGenerator.generate_code
  end
end
