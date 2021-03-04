# frozen_string_literal: true

class ComicsController < ApplicationController
  def index
    comics = Comic.where("#{params[:cursol]} < id").limit(params[:limit])
    render json: comics
  end

  def show
    comic = Comic.find(params[:id])
    render json: comic
  end
end
