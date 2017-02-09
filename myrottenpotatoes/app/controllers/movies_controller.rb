# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.html.haml by default
  end
  
  def new
    @movie = Movie.new
    # default: render 'new' template
  end
  
  def create
    # params.require(:movie)
    # permitted = params[:movie].permit(:title,:rating,:release_date)
    # shortcut: 
    permitted = params.require(:movie).permit(:title,:rating,:release_date)
    # rest of code...
    # using permitted instead of params[:movie]
    @movie = Movie.create!(permitted)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end
  
  def edit
    @movie = Movie.find params[:id]
  end
  
  def update
    @movie = Movie.find params[:id]
    # Error with @movie.update_attributes!(params[:movie])
    permitted = params[:movie].permit(:title, :rating, :description, :release_date)
    @movie.update_attributes!(permitted)
    flash[:notice] = "#{@movie.title} was successfully updated."
    # Replaced with below, for SOA redirect_to movie_path(@movie)
    respond_to do |client_wants|
      client_wants.html {  redirect_to movie_path(@movie)  } # as before
      client_wants.xml  {  render :xml => @movie.to_xml    }
    end
  end
  
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
  
end