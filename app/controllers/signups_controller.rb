class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    
    def index 
        signups =  Signup.all 
        render json: signups
    end
    def create 
            signup = Signup.create!(signup_params)
            render json: signup.activity, status: :created
    end
    private 
    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end
    def record_not_found 
        render json: {error: "Signups not found" }, status: 201
     end
     
     def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: 422
     end
end
