## TODO: Implement CSV reading/writing
require 'csv'
require_relative 'contact'

class ContactDatabase

  attr_accessor :name, :email

  class << self
    def write(temp_object)
      CSV.open("contacts.csv", "a+") do |csv|
        csv << [temp_object.id, temp_object.name, temp_object.email]
      end
    end
    # CSV.foreach('contacts.csv') do |csv|
    #     obj_id = csv[0].to_i
    #     #binding.pry
    #     name = csv[1]
    #     email = csv[2]
    #     phone_number = csv[3]
    #     Contact.create(obj_id, name, email)
    #     #binding.pry
    #   end
    # end
    def read
      CSV.foreach("contacts.csv") do |csv|
        name = csv[1]
        email = csv[2]
        Contact.create(name, email)
        #Contact.id = csv[0]

      end
    end
  end

end