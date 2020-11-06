class Api::StudentsController < ApplicationController
	before_action :set_student, only: [:show, :update, :destroy]

	def index
		@students = Student.all
		render json: @students
	end

	def show
		render json: @student
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			render json: @student, status: :created
		else
			render json:@student.errors, status: :unprocessable_entity
		end
	end

	def update
		if @student.update_attributes(student_params)
			render json: @student
		else
			render json:@student.errors, status: :unprocessable_entity
		end
	end
	def destroy
		@student.destroy
	end

	private

	def set_student
		@student = Student.find_by_name(params[:name])
	end

	def student_params
		params.require(:students).permit(:name, :contact, :email, :dob, :age)
	end

end
