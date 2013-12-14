module MenacesHelper
  def transition_path(menace, transition)
    self.send("#{transition}_manage_menace_path", menace) 
  end
end
