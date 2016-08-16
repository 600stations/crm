#require_relative 'crm'

class Contact

  attr_accessor :first_name, :last_name, :email, :note#attr_accessor is a class method
  attr_reader :id


@@contacts = []#will store all contact instances is a class variable
@@id = 1# set default value for counter
    def initialize(first_name, last_name, email, note)
       @first_name = first_name
       @last_name = last_name
       @email = email
       @note = note
       @id = @@id# check this
       @@id += 1 # this way the next contact will get a different id
     end


  # This method should call the initializer,
  # store the newly created contact, and then return it
  # remember, we preface the method name with 'self.' if it is a class method
def self.create(first_name, last_name, email, note)
  new_contact = Contact.new(first_name, last_name, email, note)
  @@contacts << new_contact
  return new_contact
end

  # This class method should return all of the existing contacts(all instances)
#attaching this method to the class of Contact
  def self.all
  @@contacts #returns all my contact list
  end

  def full_name # this returns full name
    "#{@first_name} #{@last_name}" #don't need instance variables since attr_accessor but bot work
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do|x|
      if x.id == id
        return x 
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by

  end

  # This method should delete all of the contacts
  def self.delete_all
@@contacts.clear #empties @@contacts array "the rolodex"
  end

  def full_name
   "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete()
    return @@contacts.delete(self)#this deletes contact from rolodex
  end

  # Feel free to add other methods here, if you need them.

end
