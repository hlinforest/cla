require 'pry'
class Contact
  class RecordNotFoundError < StandardError
  end
  attr_accessor :name, :email, :id
  @@contacts = []
  @@ids = 0
  def initialize(id, name, email)
    # TODO: assign local variables to instance variables
    @id = id
    @name = name
    @email = email

  end
 
  def to_s
    # TODO: return string representation of Contact
  end
 
  ## Class Methods
  class << self
    def create(name, email)
      @@ids += 1
      @@contacts << Contact.new(@@ids, name, email)
      @@contacts.last
      #binding.pry
      # TODO: Will initialize a contact as well as add it to the list of contacts
    end

    def check_duplicate?(name, email)
      a_duplicate = @@contacts.find {|a_contact| a_contact.email == email && a_contact.name == name}
      #binding.pry
    end
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
      find_result = @@contacts.select {|a_contact| a_contact.name.include?(term) || a_contact.email.include?(term)}
      #binding.pry
    end
 
    def all
      # TODO: Return the list of contacts, as is
      @@contacts
    end
    # begin
    #     raise BadPasswordError, "Password is too short" if password.length < 6
    #     @@users << User.new(username, email, password)
    #     @@users.last
    #   rescue BadPasswordError => e
    #     puts e.message
    #     e.backtrace.each do |msg|
    #       puts msg
    #     end
    #     false
    #   end
    def show(id)
      # TODO: Show a contact, based on ID
      #begin
        temp_contact = @@contacts.detect do |a_contact|
          
          a_contact.id == id.to_i
          #raise RecordNotFoundError 
        end
        if temp_contact == nil
          raise RecordNotFoundError, "Record not found"
        end
      #rescue 
       # puts "Record not found"
        #exit
      #end 
        
       # binding.pry
      #end
    end
    
  end
 
end