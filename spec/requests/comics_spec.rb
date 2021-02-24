# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ComicsController, type: :request do
  subject do
    get comic_path(id: comic_id)
    response
  end

  let :comic do
    create(:comic)
  end

  let :comic_id do
    comic.id
  end

  it 'returns success' do
    expect(subject).to have_http_status(:success)
  end

  context '指定したidに紐付くcomicが存在しない場合' do
    let :comic_id do
      999
    end

    it 'returns not_found' do
      expect(subject).to have_http_status(:not_found)
    end
  end
end