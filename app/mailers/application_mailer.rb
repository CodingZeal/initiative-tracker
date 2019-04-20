# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'admin@codingzeal.com'
  layout 'mailer'
end
