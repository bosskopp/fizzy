if ENV["SMTP_ADDRESS"].present?
    Rails.application.config.action_mailer.delivery_method = :smtp
    Rails.application.config.action_mailer.smtp_settings = {
        address: ENV["SMTP_ADDRESS"],
        port: ENV.fetch("SMTP_PORT", 587).to_i,
        user_name: ENV["SMTP_USERNAME"],
        password: ENV["SMTP_PASSWORD"],
        authentication: ENV.fetch("SMTP_AUTHENTICATION", "plain").to_sym,
        enable_starttls_auto: ENV.fetch("SMTP_ENABLE_STARTTLS", "true") == "true",
        domain: ENV["SMTP_DOMAIN"]
    }.compact
end