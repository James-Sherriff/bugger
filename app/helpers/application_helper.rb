module ApplicationHelper
  
  def friendly_status(status_id)
    if status_id == 0
      return "Open"
    elsif status_id == 1
      return "In Progress"
    elsif status_id == 2
      return "Dealt With"
    end
  end
end
