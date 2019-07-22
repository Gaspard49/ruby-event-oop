# frozen_string_literal: true

require 'pry'

class User
  attr_accessor :email, :age
  @@all_user = []

  def initialize(email_to_save, age_to_save)
    if check_email(email_to_save) && check_age(age_to_save)
      @email = email_to_save
      @age = age_to_save
      @@all_user <<  [@email, @age]
    else
      p 'Please enter a valid email AND a valid age!'
    end
  end

  

  def self.all
    return @@all_user 
  end

  def self.find_by_email(email)
    i=0
    self.all.each do |val|
      if self.all[i][0] == email
        puts "The User age is: #{self.all[i][1]} years old."
      end
      i += 1
    end
  end

end

private

def check_email(email_to_save)
  true if email_to_save.include?('@') && email_to_save.include?('.')
end

def check_age(age_to_save)
  true if age_to_save.is_a? Integer
end

binding.pry
p 'end of file'
