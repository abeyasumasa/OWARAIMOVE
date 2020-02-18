module ComediansHelper
  def choose_new_or_edit
    if action_name == 'new'||action_name == 'create'
      confirm_comedians_path
    elsif action_name == 'edit'
      comedian_path
    end
  end
end
