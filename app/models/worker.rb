class Worker < ActiveRecord::Base
  include UniqueCodeGenerator

  validates :document, :admitted_at, :user, :role, :period, :company, :frequency, presence: true
  validates :document, :code, uniqueness: true
  validates :document, cpf:  { if: :pf? }
  validates :document, cnpj: { if: :pj? }

  has_enumeration_for :kind, with: WorkerKind, create_helpers: true, required: true

  belongs_to :user, inverse_of: :worker
  belongs_to :role
  belongs_to :period
  belongs_to :company
  belongs_to :frequency

  accepts_nested_attributes_for :user
end
