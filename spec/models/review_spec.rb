require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe 'レビューの投稿' do
    context 'レビュー投稿ができるとき' do
      it 'すべての必須入力事項が存在すれば投稿できる' do
        expect(@review).to be_valid
      end
      it 'ジャンルが[---]以外なら投稿できる' do
        @review.genre_id = 1
        expect(@review).to be_valid
      end
      it 'レビュー(5段階)が[---]以外なら投稿できる' do
        @review.evaluation_id = 1
        expect(@review).to be_valid
      end
    end

    context 'レビュー投稿ができないとき' do
      it 'レビューに紐づくユーザーが存在しなければ投稿できない' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("User must exist")
      end
      it '画像がないと投稿できない' do
        @review.image = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Image can't be blank")
      end
      it 'タイトルが空だと投稿できない' do
        @review.title = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Title can't be blank")
      end
      it '著者が空だと投稿できない' do
        @review.author = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Author can't be blank")
      end
      it 'ジャンルが[---]だと投稿できない' do
        @review.genre_id = 0
        @review.valid?
        expect(@review.errors.full_messages).to include("Genre must be other than 0")
      end
      it 'タグが20文字を超えると投稿できない' do
        @review.tag = 'a' * 21
        @review.valid?
        expect(@review.errors.full_messages).to include("Tag is too long (maximum is 20 characters)")
      end
      it 'レビュー(5段階)が[---]だと投稿できない' do
        @review.evaluation_id = 0
        @review.valid?
        expect(@review.errors.full_messages).to include("Evaluation must be other than 0")
      end
      it 'レビュー(テキスト)が300文字を超えると投稿できない' do
        @review.impression = 'a' * 301
        @review.valid?
        expect(@review.errors.full_messages).to include("Impression is too long (maximum is 300 characters)")
      end
    end
  end
end
