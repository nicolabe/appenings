def path_to(path)
  case path
    when "the login page"
      login_index_path
    when "the list of appenings"
      appenings_path
    when "the feed"
      feed_path
  end
end 
