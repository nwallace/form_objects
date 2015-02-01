module BootstrapHelper
  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)

  def display_flash
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :danger  if type == :alert
      type = :danger  if type == :error
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = bootstrap_alert(type, msg)
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end

  def bootstrap_alert(type, msg)
    content_tag(:div,
                content_tag(:button, raw("&times;"), class: "close", data: { dismiss: "alert" }) +
                msg.html_safe, class: "alert fade in alert-#{type}")
  end
end
