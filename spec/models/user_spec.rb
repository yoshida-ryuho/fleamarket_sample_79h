require 'rails_helper'

describe User do
  describe '#create' do
  # 1.必須項目が存在すれば登録できること
    it "nicknameとemail、password, password_confirmation,family_name, first_name, family_name_kana, first_name_kana ,birth_date(必須項目)が存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end
    
    it "nicknameが空では登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailが空では登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordが空では登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    
    end

    it "family_nameが空では登録できないこと" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

  
    it "first_nameが空では登録できないこと" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "family_name_kanaが空では登録できないこと" do
      user = build(:user, family_name_kana: nil)
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end
    
    it "first_name_kanaが空では登録できないこと" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
    
    it "birth_dateが空では登録できないこと" do
      user = build(:user, birth_date: nil)
      user.valid?
      expect(user.errors[:birth_date]).to include("を入力してください")
    end
    

  # 3. メールアドレスは@とドメインが必須であること
    it "メールアドレスは@とドメインがないと登録できないこと" do
      user = build(:user, email: "aaaa")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end
    
    it "メールアドレスは@があってもドメインがなければ登録できないこと" do
      user = build(:user, email: "aaaa@aaa")
      user.valid?
      expect(user.errors[:email]).to include("メールアドレスに@とドメインを含めて下さい")
    end
    
    
    it "メールアドレスは@とドメインがあれば登録できること" do
      user = build(:user,email: "aaa@aaa.com")
      user.valid?
      expect(user).to be_valid
    end


  # 12. 重複したemailが存在する場合登録できないこと
    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

  # 13. passwordが7文字以上であれば登録できること
    it "passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

  # 14. passwordが6文字以下であれば登録できないこと
    it "passwordが6文字以下であれば登録できないこと" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

  
  # 15.ユーザー本名は全角で表示させる（姓）
    it "family_nameは全角だと登録できる" do
      user = build(:user, family_name: "山田やまだヤマダ")
      user.valid?
      expect(user).to be_valid
    end
    it "family_nameは全角アルファベットでも登録できる" do
      user = build(:user, family_name: "ｙａｍａｄａ")
      user.valid?
      expect(user).to be_valid
    end
    it "family_nameが半角だと登録できないこと" do
      user = build(:user, family_name: "ﾔﾏﾀﾞ")
      user.valid?
      expect(user.errors[:family_name]).to include("は全角で入力して下さい")
    end

                  # 半角アルファベットはOKにしてみた
    it "family_nameとfirst_nameが半角アルファベットだと登録できること" do
      user = build(:user,  family_name: "yamada")
      user.valid?
      expect(user).to be_valid
    end
    
    
    
  # 15.ユーザー本名は全角で表示させる（名）
    it "first_nameは全角だと登録できる" do
      user = build(:user, first_name: "太郎たろうタロウ")
      user.valid?
      expect(user).to be_valid
    end
    it "first_nameは全角アルファベットでも登録できる" do
      user = build(:user, first_name: "ｔａｒｏｕ")
      user.valid?
      expect(user).to be_valid
    end
    it "first_nameが半角だと登録できないこと" do
      user = build(:user, first_name: "ﾀﾛｳﾞ")
      user.valid?
      expect(user.errors[:first_name]).to include("は全角で入力して下さい")
    end

              # 半角アルファベットはOKにしてみた
    it "first_nameとfirst_nameが半角アルファベットだと登録できること" do
      user = build(:user,  first_name: "yamada")
      user.valid?
      expect(user).to be_valid
    end
    
    
  
    # 18. ユーザー本名のふりがな（姓）は全角で入力させる
    it "family_name_kanaは全角ひらがなだと登録できる" do
      user = build(:user, family_name_kana: "やまだ")
      user.valid?
      expect(user).to be_valid
    end
    it "family_name_kanaは半角だと登録できない" do
      user = build(:user, family_name_kana: "ﾔﾏﾀﾞ")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は全角ひらがなで入力して下さい")
    end
  
  
  
    # 18. ユーザー本名のふりがな（名）は全角で入力させる 
    it "first_name_kanaは全角ひらがなだと登録できる" do
      user = build(:user, first_name_kana: "たろう")
      user.valid?
      expect(user).to be_valid
    end
    it "first_name_kanaは半角だと登録できない" do
      user = build(:user, first_name_kana: "ﾀﾛｳ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は全角ひらがなで入力して下さい")
    end
    
    
    


    
  end
end