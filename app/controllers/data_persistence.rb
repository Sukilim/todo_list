#list_all
#write_new
#delete
#complete
#update

require_relative '../../config/application'
require_relative '../models/task'

class TodoApplication <ActiveRecord::Base

	def self.list
		puts "Here are the list of things to do: "
		p a = Task.all
	end

	def self.add(name)
	 a = Task.create(name: "#{name}", complete: 0)
	 a.save
	 puts "Task: #{name} is added"
	end

	def self.delete(num)
		puts "Task is deleted"
		p a = Task.find_by(id: num)
		a.destroy
	end

	def self.update(num, status)
		a = Task.find_by(id: num)
		a.update(name: status)
		a.save
		puts "Status updated: "
		p a
	end

	def self.complete(num)
		a = Task.find_by(id: num)
		a.update(complete: 1)
		puts "Task mark as completed: "
		p Task.find(num)
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

