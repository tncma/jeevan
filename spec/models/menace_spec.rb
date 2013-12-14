require 'spec_helper'

def menace_params
  {
   :name => "Deepak",
   :email => "deepak@example.com",
   :what => "dogs",
   :where => "street"
  }
end

describe Menace do
  it "should have a uuid" do
    ticket = Menace.new
    ticket.uuid.should_not be_nil
  end

  it "should have the same uuid when saved and fetched" do
    ticket = Menace.create(menace_params)
    ticket_from_db = Menace.find(ticket.id)
    ticket.uuid.should == ticket_from_db.uuid
  end
end
