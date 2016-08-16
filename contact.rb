
class Contact

  attr_accessor :first_name, :last_name, :email, :note #attr_accessor is a class method
  attr_reader :id


@@contacts = []  # stores all contact instances is a class variable - effectively my rolodex
@@id = 300# set default value for counter
    def initialize(first_name, last_name, email, note)
       @first_name = first_name
       @last_name = last_name
       @email = email
       @note = note
       @id = @@id
       @@id += 1 # each new contact will get a different id
     end


  # This class method calls initializer, stores newly created contact, and returns it
  # remember, we preface the method name with 'self.' if it is a class method
def self.create(first_name, last_name, email, note)
  new_contact = Contact.new(first_name, last_name, email, note)
  @@contacts << new_contact
  return new_contact
end

  # Class method  returns all of the existing contacts(all instances)
  def self.all
  @@contacts #returns all my contact list
  end

  def full_name # this returns full name
    "#{@first_name} #{@last_name}" #don't need instance variables since attr_accessor
  end

  # class method accepts an id as an argument returns the contact w match id
  def self.find(id)
    @@contacts.each do|person|
      if person.id == id
        return person
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, modify)
        if attribute == "first name"
        @first_name = modify
        puts "The first name was changed to: #{@first_name}"
        elsif attribute == "last name"
        @last_name == modify
        puts "The last name was changed to: #{@last_name}"
        elsif attribute == "email"
        @email = modify
        puts "The new email is: #{@email}"
        elsif attribute == "note"
        @note = modify
        else
        "No match was found. Please try again"
        end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    if attribute == "first name"
      @@contacts.each do |x|
          if value == x.first_name
          return x #this is the contact
          end
        end
    elsif attribute == "last name"
      @@contacts.each do |x|
          if value == x.last_name
          return x
          end
        end
    elsif attribute == "email"
      @@contacts.each do |x|
          if value == x.email
          return x
          end
        end
    else
      "No match was found. Please try again"
      self.find_by()
    end

  end

  # This method should delete all of the contacts
  def self.delete_all
@@contacts.clear #empties @@contacts array "the rolodex"
  end

  def full_name
   "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  def delete()
    return @@contacts.delete(self)#this deletes contact from rolodex
  end


end # end of class
