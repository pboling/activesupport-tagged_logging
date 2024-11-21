# frozen_string_literal: true

# This is not the same load path as the standard Rails module, which uses an underscore in `active_support`
require "activesupport/tagged_logging/broadcasting"

RSpec.describe ActiveSupport::TaggedLogging::Broadcasting do
  before do
    @output1 = StringIO.new
    @output2 = StringIO.new
    @logger1 = ActiveSupport::TaggedLogging.new(Logger.new(@output1))
    @logger2 = ActiveSupport::TaggedLogging.new(Logger.new(@output2))
    @logger = ActiveSupport::BroadcastLogger.new(@logger1, @logger2)
  end

  it "tags with a block" do
    @logger.tagged("BCX") { @logger.info "Funky time" }
    assert_equal "[BCX] Funky time\n", @output1.string
    assert_equal "[BCX] Funky time\n", @output1.string
  end

  it "yields the logger to the block" do
    @logger.tagged("BCX") do |logger|
      assert_equal @logger, logger
    end
  end

  it "returns the return value of the block" do
    return_value = @logger.tagged("BCX") do
      "Cool story"
    end
    assert_equal "Cool story", return_value
  end

  it "returns a tagged logger without a block" do
    logger = @logger.tagged("BCX")
    logger.info "Funky time"
    assert_equal "[BCX] Funky time\n", @output1.string
    assert_equal "[BCX] Funky time\n", @output2.string
  end

  it "doesn't tag the original logger without a block" do
    @logger.tagged("BCX")
    @logger.info "Funky time"
    assert_equal "Funky time\n", @output1.string
    assert_equal "Funky time\n", @output2.string
  end

  it "ignores non-tagged loggers with a block" do
    plain_output = StringIO.new
    plain_logger = ActiveSupport::Logger.new(plain_output)
    @logger.broadcast_to(plain_logger)

    @logger.tagged("BCX") { @logger.info "Block funky time" }
    @logger.tagged("BCX").info "Chain cool story"
    assert_equal(<<~STR, plain_output.string)
      Block funky time
      Chain cool story
    STR
  end

  it "ignores non-tagged loggers without a block" do
    plain_output = StringIO.new
    plain_logger = ActiveSupport::Logger.new(plain_output)
    @logger.broadcast_to(plain_logger)

    @logger.tagged("BCX").info "Cool story"
    assert_equal "Cool story\n", plain_output.string
  end
end
