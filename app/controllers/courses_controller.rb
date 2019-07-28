class CoursesController < ApplicationController
  def index
    @courses=Course.all
  end
 
  def show
    @course=Course.find(params[:id])
    return render('show.html.erb', local:{})
  end




end
