task :default => [:tmp_dirs, :submodules, :link]

desc %(Initialize submodules)
task :submodules do
  sh "git submodule sync >/dev/null"
  sh "git submodule update --init"
end

desc %(Update each submodule from its upstream)
task :update do
  sh "git submodule foreach git pull origin master"
end

desc %(Make symlinks)
task :link do
  %w[vimrc].each do |script|
    dotfile = File.join(ENV['HOME'], ".#{script}")
    if File.exist? dotfile
      warn "~/.#{script} already exists"
    else
      ln_s File.join('.vim', script), dotfile
    end
  end
end

task :tmp_dirs do
  mkdir_p "_backup"
  mkdir_p "_temp"
end
