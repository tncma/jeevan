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
  before(:each) do
    @menace = Menace.create!(menace_params)
  end

  it "should have a uuid" do
    menace = Menace.new
    menace.uuid.should_not be_nil
  end

  it "should have the same uuid when saved and fetched" do
    menace_from_db = Menace.find(@menace.id)
    @menace.uuid.should == menace_from_db.uuid
  end

  it "should have the initial state before it is saved" do
    menace = Menace.new
    menace.should be_submitted
  end

  it "should have the initial state when it is saved for the first time" do
    @menace.should be_submitted
  end

  it "can be accepted when submitted" do
    @menace.accept
    @menace.should be_accepted
  end

  it "can be rejected when submitted" do
    @menace.reject
    @menace.should be_rejected
  end

  it "can be assigned when accepted" do
    @menace.accept
    @menace.assign
    @menace.should be_assigned
  end

  it "can be finished when assigned" do
    @menace.accept
    @menace.assign
    @menace.finish
    @menace.should be_finished
  end

  it "should not have any transition log when it is newly created" do
    @menace.transition_logs.should be_empty
  end

  it "should log a transition when it is accepted" do
    @menace.accept
    @menace.transition_logs.count.should == 1
  end 

  it "should log a transition for the accept event" do
    @menace.accept
    transition_log = @menace.transition_logs.first
    transition_log.from.should == "submitted"
    transition_log.to.should == "accepted"
  end

  it "should created transition_logs for multiple event" do
    @menace.accept
    @menace.assign
    @menace.finish
    @menace.transition_logs.count.should == 3
  end
end
