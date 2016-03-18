class Worker < ActiveRecord::Base
  extend EnumerateIt

  validates :document, :admitted_at, :user, presence: true
  validates :document, cpf:  { if: :pf? }
  validates :document, cnpj: { if: :pj? }

  has_enumeration_for :kind, with: WorkerKind, create_helpers: true, required: true

  belongs_to :user, inverse_of: :worker
  belongs_to :role
  belongs_to :period
  belongs_to :company
  belongs_to :frequency

  accepts_nested_attributes_for :user

  scope :with_code, ->(code) { where(code: code) }

  before_create :generate_code

  private

  def generate_code
    self.code = UniqueCodeGenerator.generate_code(Worker)
  end
end
