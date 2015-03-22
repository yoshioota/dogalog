module ApplicationHelper

  def convert_alert_ype(alert_type)
    case alert_type
    when 'notice'
      'success'
    else
      'unknown'
    end
  end

end
