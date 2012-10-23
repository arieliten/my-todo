class User < ActiveRecord::Base
  # == Devise Setup
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # == Setup accessible (or protected) attributes
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  # == Relations
  has_many :tasks, conditions: 'tasks.id is NOT NULL' # hotfix to bug in Rails 3 about including new records in associations
  # == Validations
  validates :name, presence: true
end
