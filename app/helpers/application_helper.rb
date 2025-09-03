module ApplicationHelper
end
def booking_status_color(status)
  case status
  when 'confirmed' then 'success'
  when 'pending' then 'warning'
  when 'canceled' then 'secondary'
  when 'rejected' then 'danger'
  else 'info'
  end
end
