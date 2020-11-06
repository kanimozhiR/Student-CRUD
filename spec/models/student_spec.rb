require 'spec_helper'

describe Student do

before(:each) do
    @student = Student.new
    @valid_attributes = { 
      name: 'test student', 
      email: "test@student.com", 
      contact: "9876543210",
      dob: "1989/2/3"}

  end

  it "should create a new instance given valid attributes" do
    @student.attributes = @valid_attributes
    @student.should be_valid
  end

#validation for presence of name
  it "validates presence of name" do
     student = Student.new(@valid_attributes.merge(name: "student"))
     student.should be_valid
  end

#validation for presence of email
  it "validates presence of email" do
     student = Student.new(@valid_attributes.merge(email: "test@stud.com"))
     student.should be_valid
  end

#validation for presence of contact
  it "validates presence of contact" do
     student = Student.new(@valid_attributes.merge(contact: "9876543210"))
     student.should be_valid
  end

#validation for presence of dob
  it "validates presence of dob" do
     student = Student.new(@valid_attributes.merge(dob: "1989/3/4"))
     student.should be_valid
  end

end
