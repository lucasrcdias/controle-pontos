class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :name, presence: true

  has_one :manager, dependent: :destroy
  has_one :worker, inverse_of: :user, dependent: :destroy

  alias_attribute :to_s, :name

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

  def jwt_token
    token = JsonWebToken.encode(user_id: self.id)

    token if self.update_attribute(:auth_token, token)
  end
end
