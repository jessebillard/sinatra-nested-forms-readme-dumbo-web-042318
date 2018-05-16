require_relative 'config/environment'

class App < Sinatra::Base

    get '/' do
        erb :new
    end 

    post '/student' do
        @student = Student.new(params["student"])

        params["student"]["course"].each do |course_details_hash|
            Course.new(course_details_hash)
        end 
        @courses = Course.all

        erb :student
    end 

end
