class Monster
  attr_reader :name, :actions
  def initialize(name)
    @name = name
    @actions = {
      screams: 0,
      scares: 0,
      runs: 0,
      hides: 0
    }
  end
  
  def say(&block)
    print "#{name} says... "
    yield
  end
  
  def inspect
    "<#{name}, #{actions}>"
  end
  
  def print_scoreboard
    puts "-" * 30
    puts "#{name} scoreboard"
    puts "-" * 30
    puts "- Screams: #{actions[:screams]}"
    puts "- Scares: #{actions[:scares]}"
    puts "- Runs: #{actions[:runs]}"
    puts "- Hides: #{actions[:hides]}"
    puts "-" * 30
  end  
  
  def scream(&block)
    actions[:screams] += 1
    print "#{name} screams! "
    yield
  end
  
  def scare(&block)
    actions[:scares] += 1
    print "#{name} scares you! "
    yield
  end
  
  def run(&block)
    actions[:runs] += 1
    print "#{name} runs! "
    yield
  end
  
  def hide(&block)
    actions[:hides] += 1
    print "#{name} hides! "
    yield self if block_given?
  end
  
end

monster = Monster.new("Fluffy")
monster.say { puts "Welcome to my home." }
puts monster.actions
monster.scream do
  puts "BOO!"
end
monster.scare do
  puts "Go Away!"
end

monster.run do
  puts "Going to get you!"
end

monster.hide do |m|
  puts "Running away and hiding!"
  puts m.inspect
end
puts "\n"
monster.print_scoreboard 