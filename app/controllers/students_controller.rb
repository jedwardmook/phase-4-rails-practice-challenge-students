class StudentsController < ApplicationController
    
    def index
        render json: Student.all
    end

    def show
        student = Student.find(params[:id])
        render json: student
    end

    def update
        student = Student.find(params[:id])
        if student
            student.update(student_params)
            render json: student
        end
    end

    def create
        student = Student.create!(student_params)
        render json: student
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
        head :no_content
    end


    private

        def student_params
            params.permit(:name, :major, :age, :instructor_id)
        end

end
