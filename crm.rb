require_relative 'contact.rb'

class Crm

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu # to print_main_menu method
      user_selected = gets.chomp.to_i # stores user input
      call_option(user_selected) # directs to call_option method with argument
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit # go to exit method for abort
    end
  end

  def add_new_contact
  print 'Enter First Name: '
  first_name = gets.chomp

  print 'Enter Last Name: '
  last_name = gets.chomp

  print 'Enter Email Address: '
  email = gets.chomp

  print 'Enter a Note: '
  note = gets.chomp

  Contact.create(first_name, last_name, email, note)
end


  def modify_existing_contact()
    display_all_contacts
    puts "Please enter:"
    #puts "| 1 | for first name"
    #puts "| 2 | for last name"
    #puts "| 3 | for email"
    #puts "| 4 | for notes"
    puts "| first name | for first name"
    puts "| last name | for last name"
    puts "| email | for email"
    puts "| note | for note"
    attribute = gets.chomp
    puts "Please enter the contact's: #{attribute}"
    value = gets.chomp
    contact_detail = Contact.find_by(attribute, value)

    if attribute == "first name"
        puts "What is the new first name?"
        new_first_name = gets.chomp
        return contact_detail.update("first name", new_first_name)

      elsif attribute == "last name"
        puts "what is new last name?"
        new_last_name = gets.chomp
        return contact_detail.update("last name", new_last_name)

      elsif attribute == "email"
        puts "what is the new email?"
        new_email = gets.chomp
        return contact_detail.update("email", new_email)

      elsif attribute == "note"
        puts "what is the new note?"
        new_note = gets.chomp
        return contact_detail.update("note", new_note)
      end
    end

  def delete_contact()
    display_all_contacts
    puts "Please enter the id of the contact you wish to modify"
    id = gets.chomp.to_i
    contact_detail = Contact.find(id)
    contact_detail.delete()
  end


  def display_contacts(array_of_contacts)
    # method accepts an array of contacts as an argument then displays each contact
    array_of_contacts.each do |x| # rename
    print x
    end
  end

  def display_all_contacts
    Contact.all.each do|x|
      puts "ID:#{x.id} First name:#{x.first_name} Last name:#{x.last_name} Email:#{x.email} Note:#{x.note}"
      puts "-" * 20
    end
  end

  def search_by_attribute()
    puts "Please enter a single attribute: first name, last name, or email"
    attribute = gets.chomp
    puts "Pleae enter the contact's #{attribute}"
    value = gets.chomp
    contact_detail = Contact.find_by(attribute, value)
    #return display_contacts([contact_detail.first_name, contact_detail.last_name, contact_detail.email, contact_detail.note])
    puts "#{contact_detail.first_name}, #{ contact_detail.last_name},  #{ contact_detail.email}, #{contact_detail.note}"
  end

  def exit
    abort("Leaving the Rolodex. Good bye")
  end


end

Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')
crm = Crm.new
crm.main_menu
