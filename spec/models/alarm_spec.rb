require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @alarm = FactoryBot.build(:alarm)
    @user = FactoryBot.build(:user)
  end

  describe "アラームタスク登録" do
    context "タスク登録できる時" do
      it "全ての値が正しければ登録できる" do
        expect(@alarm).to be_valid
      end
    end

    context "タスク登録できない時" do
      it "タスクが空であれば登録できない" do
        @alarm.task = nil
        @alarm.valid?
        expect(@alarm.errors.full_messages).to include("休憩タスクを入力してください")
      end

      it 'userが紐づいていなければ登録できない' do
        @alarm.user = nil
        @alarm.valid?
        expect(@alarm.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end