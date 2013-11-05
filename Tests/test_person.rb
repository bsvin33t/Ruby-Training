require File.expand_path(File.dirname(__FILE__) + './person.rb')
require 'test/unit'

class TestPerson < Test::Unit::TestCase
	def setup
		@person =  Person.new
	end

	def test_create_person_name_field
		name = "John Doe"
		@person.name = name
		assert_equal(@person.name, name) 
	end
	def test_create_person_age_field
		age = 25
		@person.age = age
		assert_equal(@person.age, age)
	end
	def test_create_person_qualification_field
		qualification  = "BS"
		@person.qualification = qualification
		assert_equal(@person.qualification, qualification)
	end
	def test_to_hash
		person_hash = {"name" => "John Doe",
			"age" => 25,
			"qualification" => "BS"
		}
		assert_equal person_hash, @person.hashify()
	end
	
end
