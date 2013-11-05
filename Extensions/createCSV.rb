require File.expand_path(File.dirname(__FILE__) + '/../person.rb')
require 'csv'
class CreateCSV
	attr_reader :person
	def initialize(person)
		@person = person
	end

	def create
		person_hash = person.to_hash
		CSV.open('Resume.csv', 'w') do |writer|
			writer << person_hash.keys
			writer << person_hash.values
		end
		return "./Resume.csv"
	end
end
