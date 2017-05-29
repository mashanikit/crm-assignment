require 'minitest/autorun'
require 'minitest/pride'
require_relative '../contact'

class TestContact < Minitest::Test

  def setup
    @contact = Contact.create(
      first_name: 'Grace',
      last_name:  'Hopper',
      email:      'grace@hopper.com',
      note:       'computer scientist')
  end

  def teardown
    Contact.delete_all
  end

  def test_all
    expected_value = [@contact]
    actual_value = Contact.all

    assert_equal(expected_value, actual_value)
  end

  def test_find
    expected_value = @contact
    actual_value = Contact.find(@contact.id)

    assert_equal(expected_value, actual_value)
  end

  def test_find_by
    assert_equal @contact, Contact.find_by(first_name: 'Grace')
  end

  def test_delete_all
    Contact.delete_all

    expected_value = []
    actual_value = Contact.all

    assert_equal(expected_value, actual_value)
  end

  def test_full_name
    expected_value = 'Grace Hopper'
    actual_value = @contact.full_name

    assert_equal(expected_value, actual_value)
  end

  def test_update
    @contact.update(note: 'wrote the first compiler in 1952')
    assert_equal 'wrote the first compiler in 1952', @contact.note
  end

  def test_delete
    @contact.delete

    expected_value = []
    actual_value = Contact.all

    assert_equal(expected_value, actual_value)
  end

end
