
require 'rails_helper'

RSpec.describe Api::StudentsController, type: :controller do
  before :each do
    @student = Student.all      
    @student_attributes = {name: "test", contact: "9876543210", email: "sds@df.com", dob: "1989/2/2"}
  end

  describe "GET index" do
    it "assigns all students" do
      get :index
      expect(assigns(:students)).to eq(@student)
    end
  end

  describe "GET show" do
    it "assigns the requested students" do
      get :show  
      expect(assigns(:students)).to eq(Student.last)  
    end
  end 

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Student" do  
      expect{ 
        post :create, params: { students: @student_attributes}}.to change(Student, :count).by(1)         
      end

      it "assigns a newly created student as @student" do
        post :create, params: { students: @student_attributes}
        expect(assigns(:student)).to be_a(Student)
      end
    end
  end

  describe "PUT update" do
    it  "updates the new_email"do
	    student = Student.create(email: "test@ya.com")
	    expect { 
	    student.update(email: "new@ya.com'")
	  }.to change(student, :email)
	end
  end

  describe "DELETE destroy" do
    it "destroys the requested student" do
        expect { assigns[:students]}.to change(Student, :count).by(0)
    end
  end
end






