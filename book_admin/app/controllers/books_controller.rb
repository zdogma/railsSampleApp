class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :detect_mobile_variant

  def show
    @book = Book.find(params[:id])
    respond_to do |format|
      format.html
      format.csv
    end
  end

  private
  def set_book 
    @book = Book.find(params[:id])
  end

  private
  def detect_mobile_variant
    request.variant = :iPhone if request.user_agent =~ /iPhone/
    request.variant = :iPad if request.user_agent =~ /iPad/
  end

end
