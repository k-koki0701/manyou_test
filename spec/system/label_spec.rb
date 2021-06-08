require 'rails_helper'
RSpec.describe 'label機能', type: :system do
  let!(:label) {FactoryBot.create(:label)}
  let!(:second_label) {FactoryBot.create(:second_label)}


  describe '新規作成機能' do

    before do
      user = FactoryBot.create(:user)
      visit new_session_path
      fill_in 'session[email]', with:'user@example.com'
      fill_in 'session[password]', with:'user_password'
      click_button('log in')
      visit tasks_path
      visit new_task_path

      fill_in 'task_name', with: 'task'
      fill_in 'task_detail', with: 'task'
      find(".end_period").find("#task_end_period_1i").select '2021'
      find(".end_period").find("#task_end_period_2i").select '6月'
      find(".end_period").find("#task_end_period_3i").select '1'
      find(".status").find("#task_status").select '完了'
      check "会議"
    end

    context 'タスク作成画面でタスク作成をする時' do
      it 'ラベルが複数選択できる' do
        check "短期"
        click_on '登録する'
        click_on '詳細'
        expect(page).to have_content "短期"
        expect(page).to have_content "会議"
      end
    end
  end

  describe 'タスク詳細機能' do

    before do
      user = FactoryBot.create(:user)
      visit new_session_path
      fill_in 'session[email]', with:'user@example.com'
      fill_in 'session[password]', with:'user_password'
      click_button('log in')
      visit tasks_path
      visit new_task_path

      fill_in 'task_name', with: 'task'
      fill_in 'task_detail', with: 'task'
      find(".end_period").find("#task_end_period_1i").select '2021'
      find(".end_period").find("#task_end_period_2i").select '6月'
      find(".end_period").find("#task_end_period_3i").select '1'
      find(".status").find("#task_status").select '完了'
      check "会議"
    end

    context 'タスク作成画面でラベルを選択すると' do
      it '詳細画面に選択したラベルが表示される' do

        click_on '登録する'
        click_on '詳細'
        expect(page).to have_content "会議"
      end
    end
  end

  describe '検索機能' do

    before do
      user = FactoryBot.create(:user)
      visit new_session_path
      fill_in 'session[email]', with:'user@example.com'
      fill_in 'session[password]', with:'user_password'
      click_button('log in')
      visit tasks_path
      visit new_task_path

      fill_in 'task_name', with: 'task'
      fill_in 'task_detail', with: 'task'
      find(".end_period").find("#task_end_period_1i").select '2021'
      find(".end_period").find("#task_end_period_2i").select '6月'
      find(".end_period").find("#task_end_period_3i").select '1'
      find(".status").find("#task_status").select '完了'
      check "会議"
      click_on '登録する'
    end

    context 'ラベル検索をした場合' do
      it "ラベル名に完全一致するタスクが絞り込まれる" do
        visit tasks_path
        find("#label_id").select '会議'
        click_on '検索'
        expect(page).to have_content 'task'
      end
    end
  end
end
