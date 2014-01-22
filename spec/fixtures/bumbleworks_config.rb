Bumbleworks.configure do |c|
  c.storage = {}
  c.root = File.dirname(__FILE__)
end

Bumbleworks.bootstrap!
Bumbleworks.initialize!