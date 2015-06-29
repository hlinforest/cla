require 'pry'
class Contact
 
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
 
    def find(term)
      # TODO: Will find and return contacts that contain the term in the first name, last name or email
    end
 
    def all
      # TODO: Return the list of contacts, as is
      @@contacts
    end
    
    def show(id)
      # TODO: Show a contact, based on ID
      @@contacts.detect {|a_contact| a_contact.id == id.to_i} 
        
       # binding.pry
      #end
    end
    
  end
 
end