# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ComicsController, type: :request do
  describe 'indexについて' do
    subject do
      get comics_path, params: params
      response
    end

    before :each do
      target_comics
    end

    let :params do
      nil
    end

    let :target_comics do
      create_list(:comic, 10)
    end

    it 'returns success' do
      expect(subject).to have_http_status(:success)
    end

    it 'target_comicsが返ってくる' do
      ids = JSON.parse(subject.body).map { |v| v['id'] }
      expect(ids).to eq(target_comics.map(&:id))
    end

    context '追加取得を要求された場合' do
      let :comics do
        create_list(:comic, 10) + target_comic
      end

      let :target_comic do
        create_list(:comic, 10)
      end

      let :params do
        {
          cursol: target_comic.first.id - 1,
          limit: 10
        }
      end

      it 'target_comicが返ってくる' do
        ids = JSON.parse(subject.body).map { |v| v['id'] }
        expect(ids).to eq(target_comic.map(&:id))
      end
    end
  end

  describe 'showについて' do
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

      it ' 想定したメッセージが返却されること' do
        result = JSON.parse(subject.body)
        expect(result['message']).to eq('存在するcomic_idを指定してください')
      end
    end
  end
end
