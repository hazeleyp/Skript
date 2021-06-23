class Script < ApplicationRecord
  has_many :steps
  belongs_to :user
end
