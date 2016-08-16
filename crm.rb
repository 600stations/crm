require_relative 'contact.rb'

class Crm

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
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
    when 6 then exit
    # To be clear, the methods add_new_contact and modify_existing_contact
    # haven't been implemented yet
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

#  end

  def modify_existing_contact
    display_all_contacts #do we want display_all_contacts INSTEAD??
    puts "Please enter the id of the contact you wish to modify"
    id_to_modify = gets.chomp
    item_to_modify = Contact.find(id_to_modify)
    #get the instance
    item_to_modify.update#we have to pass some variables?)
      #then ###### go to update method in contacts Contact.find
    #else "please re-enter ID"
    #end
  end

  def delete_contact()
    display_all_contacts
    puts "Please enter the id of the contact you wish to modify"
    id = gets.chomp.to_i
    contact_detail = Contact.find(id)
    contact_detail.delete()
  end

  # This method should accept as an argument an array of contacts
  # and display each contact in that array
  def display_contacts

    # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods to keep your code DRY
  end

  def display_all_contacts
    Contact.all.each do|x|
      puts "#{x.id} #{x.first_name} #{x.last_name} #{x.email} #{x.note}" # do we need x.@id
      puts "-" * 20
    end    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  def search_by_attribute

    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  def exit
    abort("Leaving the Rolodex. Good bye")
  end

  # Add other methods here, if you need them.

end
crm = Crm.new
crm.main_menu
