class Task
	def view_all
		puts "View all task: "
		Task.all
	end

	def mark_complete
		a = Task.find_by(id: num)
		a.update(complete: 1)
		puts "Task mark as completed: "
		p Task.find(num)
	end
end