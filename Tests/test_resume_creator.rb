require File.expand_path(File.dirname(__FILE__) + './resume_creator.rb')
require File.expand_path(File.dirname(__FILE__) + './person.rb')


require 'test/unit'

class TestResumeCreator < Test::Unit::TestCase
	
	def setup
		person = Person.new
		person.name = "John Doe"
		person.age =  25
		person.qualification = "BS"
		@resume_creator = ResumeCreator.new(person)
	end
	def test_resume_creator_initialize
		person = Person.new
		resume_creator_test = ResumeCreator.new(person)
		assert_equal("#{resume_creator_test.class}", "ResumeCreator")
	end
	def test_available_extension_files
		extensions = Array.new()
		Dir[File.dirname(__FILE__) + './Extensions/*.rb'].each {|file| extensions.push(file) }
		extensions.each_with_index do |extension, index|
			assert_equal(extension[/Extensions(.?)\.rb/,1], 
				@resume_creator.available_extension_files[index][/Extensions(.?)\.rb/,1])
		end
	end
	def test_default_csv_creator
		filename = @resume_creator.create_resume("csv")
		assert(File.exist?(filename))
	end
end