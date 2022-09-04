require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname, email、last name, first name, kana last name, kana first name, birthday, passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
      end
      it 'passwordが6文字以上で登録できる' do
        @user.password = '890iod'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
  it 'nicknameが空では登録できない' do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
  it 'emailが空では登録できない' do
    @user.email = ''
   @user.valid?
   expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it 'passwordが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'passwordとpassword_confirmationが不一致では登録できない' do
  end

  it '重複したemailが存在する場合は登録できない' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end
  it 'emailは@を含まないと登録できない' do
    @user.email = 'testmail'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end
  it 'passwordが６文字以下では登録できない' do
    @user.password = '00000'
    @user.password_confirmation = '00000'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end
  it 'passwordが129文字以上では登録できない' do
    @user.password = Faker::Internet.password(min_length: 129)
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
  end
  it 'passwordが半角英数字混合でないと登録できない' do
    @user.password = 'aaaaaa'
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid')
  end
  it 'passwordが存在してもpassword_confirmationが空だと登録できない' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
end
it 'last_nameが空だと登録できない' do
  @user.last_name = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Last name can't be blank")
end
it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
  @user.last_name = 'aaaa'
  @user.valid?
  expect(@user.errors.full_messages).to include('Last name is invalid')
end
it 'first_nameが空だと登録できない' do
  @user.first_name = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("First name can't be blank")
end
it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
  @user.first_name = 'aaaa'
  @user.valid?
  expect(@user.errors.full_messages).to include('First name is invalid')
end
it 'kana_last_nameが空だと登録できない' do
  @user.kana_last_name = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Kana last name can't be blank")
end
it 'kana_last_nameが全角（カタカナ）でないと登録できない' do
  @user.kana_last_name = 'ああああ'
  @user.valid?
  expect(@user.errors.full_messages).to include('Kana last name is invalid')
end
it 'kana_first_nameが空だと登録できない' do
  @user.kana_first_name = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Kana first name can't be blank")
end
it 'kana_first_nameが全角（カタカナ）でないと登録できない' do
  @user.kana_first_name = 'ああああ'
  @user.valid?
  expect(@user.errors.full_messages).to include('Kana first name is invalid')
end
it 'birthdayが空だと登録できない' do
  @user.birthday = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("Birthday can't be blank")
end
end
end
end