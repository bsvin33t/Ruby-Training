require File.expand_path(File.dirname(__FILE__) + '/person.rb')
Dir[File.expand_path(File.dirname(__FILE__) + '/Extensions/*.rb')].each {|file| require file }


class ResumeCreator
	attr_reader :person
	def initialize(person)
		@person = person
	end
	def available_extension_files
		extensions = Array.new
		Dir[File.dirname(__FILE__) + '/Extensions/*.rb'].each {|file| extensions<<file }
		return extensions
	end
	def create_resume(option)
		option_object = extension_object_creator(option)
		extension_object = extension_object_creator(option)
		extension_object.create
	end

private
	def option_cleaner(option)
		"Create" << option.upcase
	end
private
	def extension_object_creator(option)
		option = option_cleaner(option)
		Object.const_get(option).new(person)
	end

end
