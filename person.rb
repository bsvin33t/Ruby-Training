
class Person
	attr_accessor :name, :age, :qualification
	def initialize
		@name =  nil
		@age = nil
		@qualification= nil
	end
	def to_hash()
		hash = Hash.new
		self.instance_variables.each {|var| hash[var.to_s.delete("@")] = self.instance_variable_get(var) }
		return hash 
	end
end