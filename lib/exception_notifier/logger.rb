class ExceptionNotifier
  class Logger
    def initialize(logdevice=nil)
      @logger = ::Logger.new(logdevice || "#{Rails.root}/log/exceptions.log")
    end

    def exception_notification(env, exception)
      @logger.error <<-MESSAGE
#{Time.new} - Rails.env: #{env}
#{exception.inspect}
#{exception.backtrace.join("\n")}
      MESSAGE
    end

  end
end
