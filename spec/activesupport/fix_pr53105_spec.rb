# frozen_string_literal: true

RSpec.describe Activesupport::FixPr53105 do
  describe "#init" do
    subject(:init) { described_class.init }

    it "does not raise" do
      block_is_expected.not_to raise_error
    end

    it "is void" do
      expect(described_class.init).to be_nil
    end
  end
end
