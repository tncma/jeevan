require 'spec_helper'

describe TransitionLog do
  it "should give 'submitted->rejected' for transition" do
    t = TransitionLog.new(from: "submitted", to: "rejected")
    t.transition.should == "submitted->rejected"
  end 

  describe TRANSITION_MESSAGES do

    before(:each) do
      @logs = [{from: "submitted", to: "accepted"},
              {from: "submitted", to: "rejected"},
              {from: "accepted", to: "assigned"},
              {from: "assigned", to: "finished"}].map do |params_hash|
                TransitionLog.new(params_hash)
              end

    end
    it "should display a message for a transition" do
      @logs.each do |log|
        #puts log.transition <- enable this for debugging
        TRANSITION_MESSAGES[log.transition].should_not be_nil
      end
    end
  end
end
