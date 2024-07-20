require 'rails_helper'

RSpec.describe Comment, type: :model do
  
  describe 'コメントの保存' do
    context 'コメントの保存ができるとき' do
      it 'コメントのテキストが存在すれば保存できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントの保存ができないとき' do
      it 'コメントのテキストが空だと保存できない' do
        @comment.text = ''
        @comment.valid?
        expect(comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'コメントのテキストが100字を超えると保存できない' do
        @comment.text =  'a' * 101
        @comment.valid?
        expect(comment.errors.full_messages).to include("Text is too long (maximum is 100 characters)")
      end
    end
  end
end
