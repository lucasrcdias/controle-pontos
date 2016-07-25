class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true

  has_one :manager, dependent: :destroy
  has_one :worker, inverse_of: :user, dependent: :destroy

  before_create :set_auth_token

  def manager?
    manager.present?
  end

  def worker?
    worker.present?
  end

  def has_company?
    manager&.company.present?
  end

  def company
    manager.company if has_company?
  end

  private

  def set_auth_token
    return if auth_token.present?
    self.auth_token = generate_auth_token
  end

  def generate_auth_token
    loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(auth_token: token)
    end
  end
end
