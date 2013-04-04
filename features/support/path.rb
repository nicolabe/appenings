def path_to(path)
  case path
    when "the login page"
      login_index_path
    when "the list of appenings"
      appenings_path
  end
end 
