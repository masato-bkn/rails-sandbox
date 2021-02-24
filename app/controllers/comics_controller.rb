# frozen_string_literal: true

class ComicsController < ApplicationController
  def show
    comic = Comic.find(params[:id])
    render json: comic
  end
end
