module BookingsHelper
  def booking_status_color(status)
    case status
    when 'pending'
      'warning'
    when 'confirmed'
      'success'
    when 'canceled'
      'danger'
    when 'rejected'
      'secondary'
    else
      'info'
    end
  end

  def booking_status_text(status)
    case status
    when 'pending'
      'قيد الانتظار'
    when 'confirmed'
      'مؤكد'
    when 'canceled'
      'ملغي'
    when 'rejected'
      'مرفوض'
    else
      status
    end
  end
end
