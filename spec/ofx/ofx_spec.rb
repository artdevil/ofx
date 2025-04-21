require "spec_helper"

describe Ofx do
  describe "#OFX" do
    it "should yield an OFX instance" do
      Ofx("spec/fixtures/sample.ofx") do |ofx|
        ofx.class.should == Ofx::Parser::OFX102
      end
    end

    it "should be an OFX instance" do
      Ofx("spec/fixtures/sample.ofx") do
        self.class.should == Ofx::Parser::OFX102
      end
    end

    it "should return parser" do
      Ofx("spec/fixtures/sample.ofx").class.should == Ofx::Parser::OFX102
    end
  end
end
