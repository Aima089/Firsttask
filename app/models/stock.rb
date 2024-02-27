class Stock < ApplicationRecord
  belongs_to :company
  belongs_to :user
  enum stock_type: {purchase:0 ,sale:1 ,issue:2}

end
