class User < ApplicationRecord
  belongs_to :company, optional: true
  has_many :stocks
  enum roles: {admin:0 ,accountant:1 ,employee:2}
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  validates :password, presence: true, length: { minimum: 6 }
  validates :role, presence: true
  
  def self.ransackable_attributes(auth_object = nil)
    %w[id name email role created_at updated_at company_id]
  end

end
