class Product < ApplicationRecord
  belongs_to :company
  belongs_to :user
  enum product_type: { raw: 0, finish: 1 }
  def self.ransackable_attributes(auth_object = nil)
    %w[id name price color product_type created_at updated_at company_id]
  end
end
