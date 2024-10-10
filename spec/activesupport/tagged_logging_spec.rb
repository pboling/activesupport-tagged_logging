# frozen_string_literal: true

RSpec.describe ActiveSupport::TaggedLogging do
  it "has a Formatter" do
    expect { described_class::Formatter }.to not_raise_error
  end
end
