require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path

        fill_in 'task_name', with: 'task'
        fill_in 'task_detail', with: 'task'
        find(".end_period").find("#task_end_period_1i").select '2021'
        find(".end_period").find("#task_end_period_2i").select '6月'
        find(".end_period").find("#task_end_period_3i").select '1'
        find(".status").find("#task_status").select '完了'

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
        FactoryBot.create(:task)
        FactoryBot.create(:second_task)
        visit tasks_path
        find('.sort_period').click
        task_end_period = all('.task_row')
        expect(task_end_period[0]).to have_content 'task'
      end
    end
    context '優先順位で昇順のソートを実行した場合' do
      it '優先順位の高いタスクが一番上に表示される' do
        FactoryBot.create(:task)
        FactoryBot.create(:second_task)
        visit tasks_path
        find('.sort_priority').click
        task_priority = all('.task_row')
        expect(task_priority[0]).to have_content 'task'
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
  describe 'タスク管理機能', type: :system do
    describe '検索機能' do
      before do
        FactoryBot.create(:task)
        FactoryBot.create(:second_task)
      end
      context 'タイトルであいまい検索をした場合' do
        it "検索キーワードを含むタスクで絞り込まれる" do
          visit tasks_path
          fill_in 'task_name', with: 'task'

          click_on '検索'

          expect(page).to have_content 'task'
        end
      end
      context 'ステータス検索をした場合' do
        it "ステータスに完全一致するタスクが絞り込まれる" do
          visit tasks_path
          find("#status").select '未着手'

          click_on '検索'

          expect(page).to have_content '未着手'
        end
      end
      context 'タイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
          visit tasks_path
          fill_in 'task_name', with: 'task'
          find("#status").select '未着手'

          click_on '検索'

          expect(page).to have_content 'task'
        end
      end
    end
  end
end
