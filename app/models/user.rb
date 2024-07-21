class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable, :timeoutable

  has_many :categories
  has_many :budgets
  has_many :transactions
end
