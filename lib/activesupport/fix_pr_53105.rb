# Support for tagged logging from broadcast logging.
#   ActiveSupport::FixPr53105.init
# See: https://github.com/rails/rails/pull/53105
module ActiveSupport
  module FixPr53105
    def init
      require_relative "tagged_logging/broadcasting"
    end
    module_function :init
  end
end
