require 'rails_helper'

describe 'QAアプリ', type: :system do
  let(:user_a) { FactoryBot.create(:user, name: 'A', email: 'a@example.com')}
  let(:question_a){ FactoryBot.create(:question, title: '最初のq')}
  shared_examples_for ''
  before do
    # ユーザAを作成する
    # 作成者がユーザAである質問を作成する
    FactoryBot.create(:question, title: '最初のq')
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'password', with: login_user.password
    click_button 'ログイン'
  end
  describe 'qa_index' do
    context 'ユーザAがログインしている時' do
      let(:login_user){ user_a }
      it '質問が全て表示される' do
        #  画面上に質問が表示されていることを確認する
        expect(page).to have_content '最初のq'
      end
    end
  end
  describe '詳細機能表示機能' do
    context 'ユーザAがログインしている時' do
      let(:login_user){ user_a}
      before do
        visit question_path(question_a)
      end
      it 'ユーザAが作成した質問が表示される' do
        expect(page).to have_content '最初のq'
      end
    end
  end

  describe '新規作成機能' do
    let(:login_user){user_a}

    before do
      visit new_question_path
      fill_in '名称', with: question_title
      click_button '登録する'
    end
    context '新規作成画面で名称を入力しなかった時' do
      let(:question_title){ '' }
      it 'error'do
        within '#error_explanation' do
          expect(page).to have_content 'タイトルを入力してください'
        end
      end
    end
  end
end
