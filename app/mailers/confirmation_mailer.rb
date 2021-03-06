class ConfirmationMailer < ApplicationMailer
  def email(confirmation_mail)
    delivery_options = Rails.application.config.sisito.fetch(:smtp).fetch(confirmation_mail.from)
    delivery_options = delivery_options.to_h.symbolize_keys

    mail(from: confirmation_mail.from,
         to: confirmation_mail.to,
         subject: confirmation_mail.subject,
         body: confirmation_mail.body,
         delivery_method_options: delivery_options)
  end
end
