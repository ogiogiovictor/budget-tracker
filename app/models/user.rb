class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  validates :name, presence: true, allow_blank: false

  has_many :expenses, foreign_key: :user_id, dependent: :destroy
  has_many :categories, foreign_key: :user_id, dependent: :destroy

end
