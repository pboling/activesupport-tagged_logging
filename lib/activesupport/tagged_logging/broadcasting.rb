if defined?(ActiveSupport::BroadcastLogger)
  module ActiveSupport
    module TaggedLogging
      # This module is included in ActiveSupport::BroadcastLogger to enable
      # broadcasting to tagged loggers with equivalent semantics.
      module Broadcasting
        def tagged(*tags, &block)
          return super unless broadcasts.any? { |logger| logger.respond_to?(:tagged) }

          if block_given?
            # `tagged(...) { |logger| ... }` yields itself to the block
            broadcasts.inject(block) do |block, logger|
              if logger.respond_to?(:tagged)
                proc { logger.tagged(*tags) { block.call(self) } }
              else
                block
              end
            end.call
          else
            # `tagged(...) returns a new logger with the tags pushed
            self.class.new(*broadcasts.map { |logger|
              logger.respond_to?(:tagged) ? logger.tagged(*tags) : logger
            })
          end
        end
      end
    end
  end

  ActiveSupport::BroadcastLogger.include(ActiveSupport::TaggedLogging::Broadcasting)
else
  warn "[Activesupport::TaggedLogging] ActiveSupport::BroadcastLogger is not available, therefore broadcasting to tagged loggers is not supported."
end
