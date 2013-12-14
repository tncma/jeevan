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
end
