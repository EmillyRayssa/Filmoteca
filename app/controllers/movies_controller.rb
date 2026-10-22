class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]


  def index
    @movies = Movie.all
  end


  def show
  end


  def new
    @movie = Movie.new
  end


  def edit
  end

  
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: "Filme adcionado com Sucesso" }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @movie.errors, status: :unprocessable_content }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Filme atualizado com Sucesso.", status: :see_other }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @movie.errors, status: :unprocessable_content }
      end
    end
  end

  
  def destroy
    @movie.destroy!

    respond_to do |format|
      format.html { redirect_to movies_path, notice: "Filme excluido com Sucesso.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    
    def set_movie
      @movie = Movie.find(params.expect(:id))
    end

  
    def movie_params
      params.expect(movie: [ :title, :director, :genre, :release_year, :rating, :synopsis, :poster_url, :review ])
    end
end
