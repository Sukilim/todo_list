require_relative 'config/application'
require_relative 'app/models/task'

puts "Put your application code in #{File.expand_path(__FILE__)}"

command = ARGV.shift
string = ARGV.join(" ")

[command, string]

case command
when 'list'
	puts "All task: "
	task = Task.all
	task.each_with_index do |task, index|
		if task.complete == 0
			puts "#{index + 1}. #{task.name} [Not Done]"
		else 
			puts "#{index + 1}. #{task.name} [Done]"
		end
	end
when 'add'
	task = Task.create(name: string, complete: 0)
	task.save
	puts "Task: #{string} is added"
when 'delete'
	# task = Task.all
	# puts "Task is deleted"
	# 	p a = Task.find(string.to_i)
	# 	a.destroy
	task = Task.all
	index = string.to_i
	task = task[index - 1]
	task.destroy
	puts "Task is deleted: #{task.name}"
when 'complete'
	task = Task.all
	index = string.to_i
	task = task[index -1]
	task.update(complete: 1)
	task.save
	puts "Task mark as completed: #{task.name}"
else 
	puts "Invalid Command."
end

