class ReportUpdate < ApplicationRecord
  belongs_to :report
  belongs_to :user
end
