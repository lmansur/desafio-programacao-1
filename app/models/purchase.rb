class Purchase < ApplicationRecord
  belongs_to :import, optional: true
end
