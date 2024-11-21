# External libraries
require "active_support/version"
require "version_gem"

# This library's version
require_relative "activesupport/tagged_logging/version"

# Loads supporting features from Rails v5, 6, 7, or 8
require "active_support/core_ext/module/delegation"
require "active_support/core_ext/object/blank"

# Require the extracted-from-Rails-8 ActiveSupport::BroadcastLogger
# It will handle properly loading the extracted-from-Rails-8 ActiveSupport::Logger
require "activesupport-broadcast_logger"

# !!ORDER MATTERS!!
#
# Extracted from:
# https://github.com/rails/rails/blob/592a52b9370df79787d74b1bac9b201891c45054/activesupport/lib/active_support/tagged_logging.rb
# which at the time was the latest version of the file on `main` branch.
# Compare SHA with latest commit to the same file on `main` to check for changes:
# https://github.com/rails/rails/blob/main/activesupport/lib/active_support/tagged_logging.rb
#
# All this reloading might print warnings about redefined methods, and this is expected.
# Technically it might even break things, but we don't expect it to, and YMMV.
require_relative "activesupport/tagged_logging"

# If you want to use the fix in the PR, run:
#   Activesupport::FixPr53105.init
# See: https://github.com/rails/rails/pull/53105/files
require_relative "activesupport/fix_pr_53105"

# Namespace for the Version of this gem (and nothing else)
module Activesupport
end

Activesupport::TaggedLogging::Version.class_eval do
  extend VersionGem::Basic
end
