class Client < ApplicationRecord
  validates :document, presence: true, uniqueness: {case_sensitive: false}
  before_save { self.mail = mail.downcase }
  has_many :orders, dependent: :destroy
end
