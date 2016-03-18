class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true

  has_one :manager, dependent: :destroy
  has_one :worker, inverse_of: :user, dependent: :destroy

  def manager?
    manager.present?
  end

  def worker?
    worker.present?
  end

  def has_company?
    manager? && manager.company.present?
  end

  def company
    manager.company if has_company?
  end
end
