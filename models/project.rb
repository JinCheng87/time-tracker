class Project < ActiveRecord::Base
  belongs_to :user
  has_many :work_sessions
  validates :name, presence: true
  validates :start_date, presence: true
  validates :description, presence: true
  validates :user_id ,presence: true
end
