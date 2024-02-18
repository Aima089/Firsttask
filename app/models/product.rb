class Product < ApplicationRecord
  belongs_to :company
  enum product_type: { raw: 0, finish: 1 }

end
