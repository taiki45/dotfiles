def cabal_install(name, options = {})
  unless_command = options[:unless] + " >/dev/null 2>&1"
  cond = !system(unless_command)

  if cond
    sh "cabal install #{name}"
  else
    puts "arleady installed #{name}"
  end
end

def cabal_dev(name)
  if File.exist? File.expand_path("~/.#{name}")
    puts "arleady installed #{name}"
  else
    sh "cabal-dev install --sandbox=~/.#{name} #{name}"
  end
end

desc "install hackage bins with cabal-dev"
task :hackage_bins do
  cabal_install 'ghc-mod', unless: 'which ghc-mod'
  cabal_install 'cabal-dev', unless: 'which cabal-dev'
  cabal_dev 'hsenv'
  cabal_dev 'hoogle'
  cabal_dev 'pointfree'
  cabal_dev 'hlint'
  cabal_dev 'hasktags'
end
