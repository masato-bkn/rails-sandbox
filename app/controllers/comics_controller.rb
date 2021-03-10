# frozen_string_literal: true

class ComicsController < ApplicationController
  def index
    comics = Comic.all

    comics = comics.where('id > ?', params[:cursol]) if params[:cursol].present?
    comics = comics.limit(params[:limit] || 10)

    render json: comics
  end

  def show
    comic = Comic.find(params[:id])
    render json: comic
  end
end
