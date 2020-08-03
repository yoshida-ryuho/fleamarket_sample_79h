require 'rails_helper'

describe Destination do
  describe '#create' do
  
  # 1.(必須項目)が存在すれば登録できること
    it "destination_family_name, destination_first_name, destination_family_name_kana, destination_first_name_kana,post_code,pref_id,city,house_number(必須項目)が存在すれば登録できること" do
      destination = build(:destination)
      expect(destination).to be_valid
    end    

  # 2. 必須項目が一つでも欠けると登録できないこと
    it "destination_family_nameが空では登録できないこと" do
      destination = build(:destination, destination_family_name: nil)
      destination.valid?
      expect(destination.errors[:destination_family_name]).to include("を入力してください")
    end

    it "destination_first_nameが空では登録できないこと" do
      destination = build(:destination, destination_first_name: nil)
      destination.valid?
      expect(destination.errors[:destination_first_name]).to include("を入力してください")
    end

    it "destination_family_name_kanaが空では登録できないこと" do
      destination = build(:destination, destination_family_name_kana: nil)
      destination.valid?
      expect(destination.errors[:destination_family_name_kana]).to include("を入力してください")
    end

    it "destination_first_name_kanaが空では登録できないこと" do
      destination = build(:destination, destination_first_name_kana: nil)
      destination.valid?
      expect(destination.errors[:destination_first_name_kana]).to include("を入力してください")
    end

    it " post_codeが空では登録できないこと" do
      destination = build(:destination, post_code: nil)
      destination.valid?
      expect(destination.errors[:post_code]).to include("を入力してください")
    end

    it "pref_idが空では登録できないこと" do
      destination = build(:destination, pref_id: nil)
      destination.valid?
      expect(destination.errors[:pref_id]).to include("を入力してください")
    end

    it "cityが空では登録できないこと" do
      destination = build(:destination, city: nil)
      destination.valid?
      expect(destination.errors[:city]).to include("を入力してください")
    end
    
 
    it "house_numberが空では登録できないこと" do
      destination = build(:destination, house_number: nil)
      destination.valid?
      expect(destination.errors[:house_number]).to include("を入力してください")
    end

    
    
  # 15.送付先氏名は全角で表示させる（姓）
     it "destination_family_nameは全角だと登録できる" do
      destination = build(:destination, destination_family_name: "山田やまだヤマダ")
      destination.valid?
      expect(destination).to be_valid
    end
    
    it "destination_family_nameは全角アルファベットでも登録できる" do
      destination = build(:destination, destination_family_name: "ｙａｍａｄａ")
      destination.valid?
      expect(destination).to be_valid
    end
    
    it "destination_family_nameが半角だと登録できないこと" do
      destination = build(:destination, destination_family_name: "ﾔﾏﾀﾞ")
      destination.valid?
      expect(destination.errors[:destination_family_name]).to include("は全角で入力して下さい")
    end

                # 半角アルファベットはOKにした
    it "destination_family_nameが半角アルファベットだと登録できること" do
      destination = build(:destination,  destination_family_name: "yamada")
      destination.valid?
      expect(destination).to be_valid
    end
    
    
    
    
  # 15.送付先氏名は全角で表示させる(名)
    it "destination_first_nameは全角だと登録できる" do
      destination = build(:destination, destination_first_name: "太郎たろうタロウ")
      destination.valid?
      expect(destination).to be_valid
    end
    it "destination_first_nameは全角アルファベットでも登録できる" do
      destination = build(:destination, destination_first_name: "ｔａｒｏｕ")
      destination.valid?
      expect(destination).to be_valid
    end
    it "destination_first_nameが半角だと登録できないこと" do
      destination = build(:destination, destination_first_name: "ﾀﾛｳﾞ")
      destination.valid?
      expect(destination.errors[:destination_first_name]).to include("は全角で入力して下さい")
    end

              # 半角アルファベットはOKにした
    it "destination_first_nameが半角アルファベットだと登録できること" do
      destination = build(:destination,  destination_first_name: "yamada")
      destination.valid?
      expect(destination).to be_valid
    end
    
    

  # 17. 送付先氏名のふりがな（姓）は全角で入力させる
    it "destination_family_name_kanaは全角ひらがなだと登録できる" do
      destination = build(:destination, destination_family_name_kana: "やまだ")
      destination.valid?
      expect(destination).to be_valid
    end
    it "destination_family_name_kanaは半角だと登録できない" do
      destination = build(:destination, destination_family_name_kana: "ﾔﾏﾀﾞ")
      destination.valid?
      expect(destination.errors[:destination_family_name_kana]).to include("は全角ひらがなで入力して下さい")
    end
   
  # 17. 送付先氏名のふりがな（名）は全角で入力させる
    it "destination_first_name_kanaは全角ひらがなだと登録できる" do
      destination = build(:destination, destination_first_name_kana: "たろう")
      destination.valid?
      expect(destination).to be_valid
    end
    it "destination_first_name_kanaは半角だと登録できない" do
      destination = build(:destination, destination_first_name_kana: "ﾀﾛｳ")
      destination.valid?
      expect(destination.errors[:destination_first_name_kana]).to include("は全角ひらがなで入力して下さい")
    end

    
    
  # post_codeはハイフンなし7文字で登録する 
    it "post_codeが7文字であれば登録できること " do
      destination = build(:destination, post_code: "1234567")
      expect(destination).to be_valid
    end
    
    
    it "post_codeが8文字以上であれば登録できないこと" do
      destination = build(:destination, post_code: "12345678")
      destination.valid?
      expect(destination.errors[:post_code]).to include("はハイフンなし７桁で入力して下さい")
    end
  
    it "post_codeが6文字以下であれば登録できないこと" do
      destination = build(:destination, post_code: "123456")
      destination.valid?
      expect(destination.errors[:post_code]).to include("はハイフンなし７桁で入力して下さい")
    end
    
    it "post_codはハイフンあれば登録できないこと" do
      destination = build(:destination, post_code: "-")
      destination.valid?
      expect(destination.errors[:post_code]).to include("はハイフンなし７桁で入力して下さい")
    end
    
    



  end
end