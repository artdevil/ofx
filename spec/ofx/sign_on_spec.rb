require "spec_helper"

describe Ofx::SignOn do
  before do
    @ofx = Ofx::Parser::Base.new("spec/fixtures/creditcard.ofx")
    @parser = @ofx.parser
    @sign_on = @parser.sign_on
  end

  describe "sign_on" do
    it "should return language" do
      @sign_on.language.should == "ENG"
    end

    it "should return Financial Institution ID" do
      @sign_on.fi_id.should == "24909"
    end

    it "should return Financial Institution Name" do
      @sign_on.fi_name.should == "Citigroup"
    end

    it "should return status" do
      @sign_on.status.should be_a(Ofx::Status)
    end
  end
end
