class Client < ApplicationRecord
  validates :document, presence: true, uniqueness: {case_sensitive: false}
  has_many :orders, dependent: :destroy
end
