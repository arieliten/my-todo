class User < ActiveRecord::Base
  # == Devise Setup
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :validatable, :token_authenticatable

  # == Setup accessible (or protected) attributes
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  # == Relations
  has_many :tasks, conditions: 'tasks.id is NOT NULL' # hotfix to bug in Rails 3 about including new records in associations
  # == Validations
  validates :name, presence: true
  # == Callbacks
  before_save :ensure_authentication_token
end
