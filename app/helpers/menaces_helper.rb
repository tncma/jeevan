module MenacesHelper
  def transition_path(menace, transition)
    self.send("#{transition}_manage_menace_path", menace) 
  end

  def transition_label_class(log)
    case log.to
    when "finished"
      "success"
    when "rejected"
      "alert"
    else
      ""
    end
  end
end
