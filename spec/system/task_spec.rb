require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path

        fill_in 'task_task_name', with: 'task'
        fill_in 'task_task_detail', with: 'task'

        click_on '登録する'

        expect(page).to have_content 'task'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, task_name: 'task', task_detail:'task')

        visit tasks_path

        expect(page).to have_content 'task'
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        FactoryBot.create(:task)
        FactoryBot.create(:second_task)
        visit tasks_path
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'task2'
        expect(task_list[1]).to have_content 'task'
      end
    end
    context '終了期限で降順のソートを実行した場合' do
      it '終了期限の一番遅いタスクが一番上に表示される' do
        FactoryBot.create(:task, task_name: 'task', task_detail: 'task', end_period: Date.today)
        FactoryBot.create(:task, task_name: 'task2', task_detail: 'task2', end_period: Date.today - 1)
        visit tasks_path
        find('.sort_period').click
        task_end_period = all('.task_row')
        expect(task_end_period[0]).to have_content 'task'
      end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        task = FactoryBot.create(:task, task_name: 'task', task_detail:'task')

        visit task_path(task.id)

        expect(page).to have_content 'task'
       end
     end
  end
end
