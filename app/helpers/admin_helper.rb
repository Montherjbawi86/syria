module AdminHelper
  def user_badge_color(role)
    case role.to_s
    when 'admin' then 'warning'
    when 'driver' then 'success'
    when 'passenger' then 'info'
    else 'secondary'
    end
  end

  def booking_status_color(status)
    case status.to_s
    when 'confirmed' then 'success'
    when 'pending' then 'warning'
    when 'canceled' then 'danger'
    when 'rejected' then 'secondary'
    else 'info'
    end
  end
end
