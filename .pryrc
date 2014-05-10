def _time(repetitions = 100, &block)
  require 'benchmark'
  Benchmark.bm{|b| b.report{repetitions.times(&block)}}
end

begin
    require 'bond'
rescue Exception
end
