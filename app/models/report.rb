class Report < ApplicationRecord
  belongs_to :application
  has_many :report_updates
end
