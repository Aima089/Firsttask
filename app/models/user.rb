class User < ApplicationRecord
  belongs_to :company
  
  enum roles: {admin:0 ,accountant:1 ,employee:2}
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  validates :password, presence: true, length: { minimum: 6 }
  validates :role, presence: true

end
