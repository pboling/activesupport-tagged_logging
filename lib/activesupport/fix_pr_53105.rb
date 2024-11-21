# Support for tagged logging from broadcast logging.
#   Activesupport::FixPr53105.init
# See: https://github.com/rails/rails/pull/53105
module Activesupport
  module FixPr53105
    # @return void
    def init
      require_relative "tagged_logging/broadcasting"

      nil
    end
    module_function :init
  end
end
