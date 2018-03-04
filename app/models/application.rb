class Application < ApplicationRecord
  has_many :reports
  serialize :developers, Array
end
