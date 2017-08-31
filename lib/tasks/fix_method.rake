namespace :fix_method do
  task :rebuild_indexes do
    [BlogComment, BlogFile, Blog, ContactMe, Project].each {|model| model.reindex}
  end
end
