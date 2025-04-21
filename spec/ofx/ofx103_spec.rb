require "spec_helper"

describe Ofx::Parser::OFX103 do
  before do
    @ofx = Ofx::Parser::Base.new("spec/fixtures/v103.ofx")
    @parser = @ofx.parser
  end

  it "should have a version" do
    Ofx::Parser::OFX103::VERSION.should == "1.0.3"
  end

  it "should set headers" do
    @parser.headers.should == @ofx.headers
  end

  it "should trim trailing whitespace from headers" do
    headers = Ofx::Parser::OFX103.parse_headers("VERSION:103   ")
    headers["VERSION"].should == "103"
  end

  it "should set body" do
    @parser.body.should == @ofx.body
  end

  it "should set account" do
    @parser.account.should be_a_kind_of(Ofx::Account)
  end

  it "should set account" do
    @parser.sign_on.should be_a_kind_of(Ofx::SignOn)
  end

  it "should set statements" do
    @parser.statements.size.should == 1
    @parser.statements.first.should be_a_kind_of(Ofx::Statement)
  end

  it "should know about all transaction types" do
    valid_types = [
      'CREDIT', 'DEBIT', 'INT', 'DIV', 'FEE', 'SRVCHG', 'DEP', 'ATM', 'POS', 'XFER',
      'CHECK', 'PAYMENT', 'CASH', 'DIRECTDEP', 'DIRECTDEBIT', 'REPEATPMT', 'OTHER'
    ]
    valid_types.sort.should == Ofx::Parser::OFX103::TRANSACTION_TYPES.keys.sort

    valid_types.each do |transaction_type|
      transaction_type.downcase.to_sym.should equal Ofx::Parser::OFX103::TRANSACTION_TYPES[transaction_type]
    end
  end
end
