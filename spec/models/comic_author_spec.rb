# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ComicAuthor, type: :model do
  let :comic_author do
    build(:comic_author, comic: comic, author: author)
  end

  let :comic do
    create(:comic)
  end

  let :author do
    create(:author)
  end

  it do
    expect(comic_author).to be_valid
  end

  context 'comicについて' do
    context 'comicがnilの場合' do
      let :comic do
        nil
      end

      it do
        expect(comic_author).to be_invalid
      end
    end
    it 'comicが参照できること' do
      # saveしないとcomic_authorのfactoryでcomicが生成されない
      comic_author.save
      expect(comic_author.comic.id).to eq(comic.id)
    end
  end

  context 'authorについて' do
    context 'authorがnilの場合' do
      let :author do
        nil
      end

      it do
        expect(comic_author).to be_invalid
      end
    end

    it 'authorが参照できること' do
      # saveしないとcomic_authorのfactoryでauthorが生成されない
      comic_author.save
      expect(comic_author.author.id).to eq(author.id)
    end
  end
end
