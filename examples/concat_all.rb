require 'rx_ruby'

source = RxRuby::Observable.range(0, 3)
  .map {|x| RxRuby::Observable.range(x, 3) }
  .concat_all

subscription = source.subscribe(
  lambda {|x|
    puts 'Next: ' + x.to_s
  },
  lambda {|err|
    puts 'Error: ' + err.to_s
  },
  lambda {
    puts 'Completed'
  })

# => Next: 0
# => Next: 1
# => Next: 2
# => Next: 1
# => Next: 2
# => Next: 3
# => Next: 2
# => Next: 3
# => Next: 4
# => Completed
