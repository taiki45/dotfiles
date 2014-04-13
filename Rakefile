def cabal_install(name)
  unless_command = "which #{name}" + " >/dev/null 2>&1"
  cond = !system(unless_command)

  if cond
    sh "cabal install #{name}"
  else
    puts "arleady installed #{name}"
  end
end

desc "install hackage bins with cabal-dev"
task :hackage_bins do
  cabal_install 'ghc-mod'
  #cabal_install 'hsenv' pending
  cabal_install 'pointfree'
  cabal_install 'hlint'
  cabal_install 'hasktags'
end
