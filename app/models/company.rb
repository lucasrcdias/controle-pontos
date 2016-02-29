class Company < ActiveRecord::Base
  validates :social_reason, :fantasy_name, :cnpj, presence: true
  validates :cnpj, :code, uniqueness: true

  before_create :generate_code

  scope :with_code, ->(code) { (where(code: code)) }

  private

  def generate_code
    self.code = CompanyCodeGenerator.generate_code
  end
end
