require "../../spec_helper"

describe Fincher::ReplacementStrategies::NShifter do
  describe "#replace!" do
    describe "when given a char" do
      it "replaces char with the codepoint + N codepoints" do
        n = 4
        shifter = Fincher::ReplacementStrategies::NShifter.new(8.to_u32, n)
        to_replace = 'b'
        replaced = shifter.replace(to_replace)

        replaced.should eq('b' + n)
      end
    end

    describe "when given a string" do
      it "replaces each char in the string with the codepoint + N codepoints" do
        n = 4
        shifter = Fincher::ReplacementStrategies::NShifter.new(8.to_u32, n)
        to_replace = "bbbbb"
        replaced = shifter.replace(to_replace)

        replaced.should eq("fffff")
      end
    end
  end
end
