# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comic, type: :model do
  let :comic do
    build(:comic, title: title)
  end

  let :title do
    'test title'
  end

  it 'modelがvalidであること' do
    expect(comic).to be_valid
  end

  it 'テーブルに登録されていること' do
    expect { comic.save }.to change { Comic.count }.from(0).to(1)
  end

  context 'titleについて' do
    context 'titleがnilの場合' do
      let :title do
        nil
      end

      it do
        expect(comic).to be_invalid
      end
    end

    context 'titleが空文字の場合' do
      let :title do
        ''
      end

      it do
        expect(comic).to be_invalid
      end
    end

    context '長すぎるタイトルの場合' do
      let :title do
        'a' * 101
      end

      it do
        expect(comic).to be_invalid
      end
    end
  end

  context 'authorsについて' do
    let :comic do
      create(:comic)
    end

    # let :author do
    #     create(:author)
    # end

    it '関連するauthorsが取得できること' do
      # create(:comic_author, comic: comic, author: author)
      # expect(comic.authors.map(&:id)).to include(author.id)

      # expect(comic.authors.map(&:id)).to include(ComicAuthor.find_by(comic_id: comic.id).author.id)
      expect(comic.authors.first.id).to eq(ComicAuthor.find_by(comic_id: comic.id).author.id)
    end
  end

  context 'comic_authorsについて' do
    let :comic do
      create(:comic)
    end

    # let :author do
    #     create(:author)
    # end

    # let :comic_author do
    #     create(:comic_author, comic: comic, author: author)
    # end
    it '関連するcomic_authorが取得できること' do
      # comic_author
      expect(comic.comic_authors.first.id).to eq(ComicAuthor.find_by(comic_id: comic.id).id)
    end
  end
end
