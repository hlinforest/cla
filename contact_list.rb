require_relative 'contact'
require_relative 'contact_database'
require 'pry'
# TODO: Implement command line interaction
# This should be the only file where you use puts and gets
#ContactDatabase.read

def help
  puts "Here is a list of available commands:"
  puts "new  - Create a new contact"
  puts "list - List all contacts"
  puts "show - Show a contact"
  puts "find - Find a contact"
end

def new_contact
  #binding.pry
  puts "Enter email: "
  input2 = STDIN.gets.chomp
  puts "Enter name: "
  input1 = STDIN.gets.chomp
  #binding.pry
  temp_dupe = Contact.check_duplicate?(input1, input2)
  binding.pry
  if temp_dupe != nil
    puts "Error: record already exists"
  else
    a_contact = Contact.create(input1, input2)
    ContactDatabase.write(a_contact)
  end

end

#a = Contact.create("stark", "abc@abc.com")
#b = Contact.create("bjerg", "bjerg@tsm.gg")
#binding.pry
a = ContactDatabase.read
#binding.pry
temp1 = ARGV[0]
temp2 = ARGV[1]
case
when temp1.eql?("new")
  new_contact
when temp1.eql?("help")
  help
when temp1.eql?("list")
  temp3 = Contact.all
  #binding.pry
  temp3.each do |temp4|
    puts "#{temp4.id}: #{temp4.name} (#{temp4.email})"
  end
  puts "---"
  puts "#{temp3.length} records total"
when temp1.eql?("show") && temp2 =~ (/\d+/)
  temp5 = Contact.show(temp2)
  puts "#{temp5.name}"
  puts "#{temp5.email}"
when temp1.eql?("find") && temp2 =~ (/\w+/)
  #binding.pry
  temp6 = Contact.find(temp2)
  temp6.each do |temp7|
    puts "#{temp7.name}"
    puts "#{temp7.email}"
    #binding.pry
  end
else
  #binding.pry
  puts "Error: wrong command"
end

