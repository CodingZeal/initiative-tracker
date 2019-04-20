if Rails.env.development?
  class SandboxEmailInterceptor
    def self.delivering_email(message)
      message.to = ['hyosunko@gmail.com']
    end
  end
  ActionMailer::Base.register_interceptor(SandboxEmailInterceptor)
end
