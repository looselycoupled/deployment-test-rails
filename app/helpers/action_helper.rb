module ActionHelper

  def current_action
    "#{controller_name}\##{action_name}"
  end

  def action_is? (array_of_actions)
    array_of_actions.include? current_action
  end

end
