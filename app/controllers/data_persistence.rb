#list_all
#write_new
#delete
#complete
#update

require_relative '../../config/application'
require_relative '../models/task'

class TodoApplication <ActiveRecord::Base

	def self.list
		puts "All task: "
		task = Task.all
		task.each_with_index do |task, index|
			if task.complete == 0
				puts "#{index + 1}. #{task.name} [Not Done]"
			else 
				puts "#{index + 1}. #{task.name} [Done]"
			end
		end
	end

	def self.add(string)
	task = Task.create(name: string, complete: 0)
	task.save
	puts "Task: #{string} is added"
	end

	def self.delete(string)
		# puts "Task is deleted"
		# p a = Task.find_by(id: num)
		# a.destroy
	task = Task.all
	index = string.to_i
	task = task[index - 1]
	task.destroy
	puts "Task is deleted: #{task.name}"
	end

	def self.update(num, status)
		a = Task.find_by(id: num)
		a.update(name: status)
		a.save
		puts "Status updated: "
		p a
	end

	def self.complete(string)
		# a = Task.find_by(id: num)
		# a.update(complete: 1)
		# puts "Task mark as completed: "
		# p Task.find(num)
		task = Task.all
		index = string.to_i
		task = task[index -1]
		task.update(complete: 1)
		task.save
		puts "Task mark as completed: #{task.name}"
	end
end

#test list:
# TodoApplication.list

#test add:
# TodoApplication.add("bake a cake")
# p Task.where(name: "bake a cake")

#test destroy:
# TodoApplication.delete(15)
# p Task.where(name: "bake a cake")

#test update:
# TodoApplication.update(2, "shower power")
# p Task.all

#test complete:
# TodoApplication.complete(4)
# p Task.find(4)


