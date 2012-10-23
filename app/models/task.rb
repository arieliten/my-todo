class Task < ActiveRecord::Base
  # == Setup accessible (or protected) attributes
  attr_accessible :title, :due_at, :priority

  # == Relations
  belongs_to :user
  # == Validations
  validates :user, :title, presence: true
  # == Scopes
  scope :completed, where(completed: true)
  scope :unfinished, where(completed: false)

end