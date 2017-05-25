require_relative 'contact'



class CRM

  def initialize(name)
    puts "Okay, this CRM has the name" + name
  end

  def main_menu
    while true
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
    note = "N/A"

    Contact.create(first_name, last_name, email)

  end

  def modify_existing_contact
    puts "What is the first name of the contact you want to modify?"
    contact = gets.chomp
    contact_found = Contact.find_by("first_name", contact)

    puts "What attribute do you want to modify?"
    attribute = gets.chomp
    puts "What do you want to modify it to?"
    change = gets.chomp


    contact_found.update(attribute, change)
  end


  def delete_contact
    puts "What is the first name of the contact you want to modify?"
    contact_delete = gets.chomp
    contact_to_delete = Contact.find_by("first_name", contact_delete)
    print "Contact deleted"
    contact_to_delete.delete
  end

  def display_all_contacts
      print ‘Displaying all contacts...’
      Contact.all.each do |contact|
        puts "#{contact.first_name} #{contact.last_name} #{contact.email} #{contact.notes}"
      end
    end

   def search_by_attribute
     print "Enter the attribute you want to search for:"
     attribute_search = gets.chomp

     print "What is the name?"
     name_search = gets.chomp

     print Contact.find_by(attribute_search, name_search)

  end
  a_crm_app = CRM.new("NewCRM")
  a_crm_app.main_menu

end
