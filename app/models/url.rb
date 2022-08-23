class Url < ApplicationRecord
  validates :full_url, allow_nil: false, presence: true
end
