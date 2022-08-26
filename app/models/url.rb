class Url < ApplicationRecord
  validates :full_url, allow_nil: false, presence: true

  validates :full_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  # found here https://stackoverflow.com/a/7168125 by atteo Collina
end
