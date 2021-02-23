# frozen_string_literal: true

class ComicsController < ApplicationController
  def show
    comic = Comic.create(title: 'hoge')
    render json: comic
  end
end
