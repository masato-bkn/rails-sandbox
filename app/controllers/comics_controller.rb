# frozen_string_literal: true

class ComicsController < ApplicationController
  def index
    cursol = params[:cursol] || 0
    limit  = params[:limit]  || 10

    comics = Comic.where("#{cursol} < id").limit(limit)
    render json: comics
  end

  def show
    comic = Comic.find(params[:id])
    render json: comic
  end
end
