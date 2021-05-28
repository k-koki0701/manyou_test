require 'rails_helper'
describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(task_name: '', task_detail: '失敗テスト')
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
     it 'バリデーションに引っかかる' do
       task = Task.new(task_name: '失敗テスト', task_detail: nil)
       task.valid?
       expect(task.errors[:task_detail]).to include("can't be blank")
     end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(task_name: '成功テスト', task_detail: '成功テスト')
        expect(task).to be_valid
      end
    end
  end
end
