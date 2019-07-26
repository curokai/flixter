class LessonsController < ApplicationController
   before_action :authenticate_user!
   before_action :require_authorized_for_current_course, only: [:show]

   def show
    @lesson=Lesson.find(params[:id])
  end

   

  private

    def require_authorized_for_current_course
    if current_course.user != current_user
      flash[:alert] = "You have to be enrolled to this course to view lessons!"
       redirect_to  course_path
    
   end
  end

  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:id])
  end



end
