require "spec_helper"

describe MenacesHelper do
  it "should return a transition path for a menace and specified transition" do
    menace = Menace.create!({
      :name => "Deepak",
      :email => "deepak@example.com",
      :what => "dogs",
      :where => "street"
    })
    
    helper.transition_path(menace, "accept").should == accept_manage_menace_path(menace)
    helper.transition_path(menace, "assign").should == assign_manage_menace_path(menace)
    helper.transition_path(menace, "reject").should == reject_manage_menace_path(menace)
    helper.transition_path(menace, "finish").should == finish_manage_menace_path(menace)
  end   
  
  it "should return success when transition_log.to==finished" do
    log = TransitionLog.new(:to => "finished")
    helper.transition_label_class(log).should == "success"
  end 

  it "should return alert transition_log.to==rejected" do
    log = TransitionLog.new(:to => "rejected")
    helper.transition_label_class(log).should == "alert"
  end

  it "should return empty string when transition_log.to!=finished|rejected" do
    log = TransitionLog.new(:to => "assigned")
    helper.transition_label_class(log).should == ""
  end
end
