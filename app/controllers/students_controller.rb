class StudentsController < ApplicationController

  def index
    #Check for query parameter-name, case insensitive search
    if request.query_parameters.key?("name")
      name = request.query_parameters[:name]
      students = Student.where("lower(first_name) = ?", name.downcase).or(Student.where("lower(last_name) = ?",name.downcase))
      render(json: students)
    else
      students = Student.all
      render json: students
    end
  end

  def show
    render(json: Student.find(params[:id]))
  end
end
