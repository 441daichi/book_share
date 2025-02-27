require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  
  describe 'コメントの保存' do
    context 'コメントの保存ができるとき' do
      it 'コメントのテキストが存在すれば保存できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントの保存ができないとき' do
      it 'コメントのテキストが空だと保存できない' do
        @comment.comment_text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment text can't be blank")
      end
      it 'コメントのテキストが100字を超えると保存できない' do
        @comment.comment_text =  'a' * 101
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment text is too long (maximum is 100 characters)")
      end
      it 'コメントに紐づくユーザーが存在しなければ保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
    end
  end
end
