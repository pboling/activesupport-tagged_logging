# External libraries
require "active_support/version"
require "version_gem"

# This library
require_relative "activesupport/tagged_logging/version"

# This gem doesn't do anything unless Rails is < v8
if ActiveSupport.version < "8"
  # Loads supporting features from Rails v5, 6, or 7
  require "active_support/core_ext/module/delegation"
  require "active_support/core_ext/object/blank"

  # Require the extracted-from-Rails-8 ActiveSupport::Logger
  require "activesupport-logger"

  # Require the original tagged logging from whatever version of Rails is loaded,
  #   so that it will be properly monkey patched.
  require "active_support/tagged_logging"

  # !!ORDER MATTERS!!
  #
  # Extracted from:
  # https://github.com/rails/rails/blob/6b7b019e07fcea00ab448ff772402a9ff7614f9e/activesupport/lib/active_support/isolated_execution_state.rb
  # Compare SHA with latest commit to check for changes:
  # https://github.com/rails/rails/blob/main/activesupport/lib/active_support/isolated_execution_state.rb
  require_relative "activesupport/isolated_execution_state"

  # Extracted from:
  # https://github.com/rails/rails/blob/592a52b9370df79787d74b1bac9b201891c45054/activesupport/lib/active_support/tagged_logging.rb
  # Compare SHA with latest commit to check for changes:
  # https://github.com/rails/rails/blob/main/activesupport/lib/active_support/tagged_logging.rb
  #
  # All this reloading might print warnings about redefined methods, and this is expected.
  # Technically it might even break things, but we don't expect it to, and YMMV.
  require_relative "activesupport/tagged_logging"

  # If you want to use the fix in the PR, run:
  #   ActiveSupport::FixPr53105.init
  # See: https://github.com/rails/rails/pull/53105/files
  require_relative "activesupport/fix_pr_53105"

  # Fallback to the original
  require "active_support/tagged_logging"
end

# Namespace for the Version of this gem (and nothing else)
module Activesupport
end

Activesupport::TaggedLogging::Version.class_eval do
  extend VersionGem::Basic
end
