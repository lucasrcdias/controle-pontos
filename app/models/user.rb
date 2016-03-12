class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_one :manager, dependent: :destroy

  def manager?
    manager.present?
  end
end
