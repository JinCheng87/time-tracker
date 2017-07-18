class User < ActiveRecord::Base
  has_secure_password
  
  has_many :projects
  has_many :work_sessions, through: :projects

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true
end
