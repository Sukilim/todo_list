require_relative 'config/application'
require_relative 'app/models/task'
require_relative 'app/controllers/data_persistence'

puts "Put your application code in #{File.expand_path(__FILE__)}"

command = ARGV.shift
string = ARGV.join(" ")

[command, string]

case command
when 'list'
	TodoApplication.list
when 'add'
	TodoApplication.add(string)
when 'delete'
	TodoApplication.delete(string)
when 'complete'
	TodoApplication.complete(string)
else 
	puts "Invalid Command."
end

