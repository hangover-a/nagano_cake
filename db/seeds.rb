# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Administrator.create!(
   email: 'hang@over',
   password: 'hangover'
)

Customer.create!(
   email: 'customer@com',
   password: 'aaaaaa',
   last_name: '田中',
   first_name: '花子',
   last_name_kana: 'タナカ',
   first_name_kana: 'ハナコ',
   postcode: '3960900',
   address: '大阪府浪速区恵美須2544-8',
   phone_number: '020145698',
   is_deleted: false
   )
Customer.create!(
   email: 'customer1@com',
   password: 'bbbbbb',
   last_name: '草薙',
   first_name: '光彦',
   last_name_kana: 'クサナギ',
   first_name_kana: 'ミツヒコ',
   postcode: '3960811',
   address: '大阪府大阪市堺南252-96',
   phone_number: '020145677',
   is_deleted: false
   )
Customer.create!(
   email: 'customer2@com',
   password: 'cccccc',
   last_name: '早乙女',
   first_name: '禅十郎',
   last_name_kana: 'サオトメ',
   first_name_kana: 'ゼンジュウロウ',
   postcode: '3967478',
   address: '東京都墨田区岡南125-85',
   phone_number: '020145677',
   is_deleted: false
   )
Customer.create!(
   email: 'customer4@com',
   password: 'dddddd',
   last_name: '鬼舞辻',
   first_name: '無惨',
   last_name_kana: 'キブツジ',
   first_name_kana: 'ムザン',
   postcode: '3964740',
   address: '山口県山口市長谷74‐98',
   phone_number: '020145787',
   is_deleted: true
   )
Customer.create!(
   email: 'customer5@com',
   password: 'eeeeee',
   last_name: '立川',
   first_name: 'たかし',
   last_name_kana: 'たちかわ',
   first_name_kana: 'たかし',
   postcode: '3978457',
   address: '沖縄県那覇市74‐98',
   phone_number: '02018887',
   is_deleted: false
   )
Customer.create!(
   email: 'customer6@com',
   password: 'ffffff',
   last_name: '亀田',
   first_name: 'ダイスケ',
   last_name_kana: 'カメダ',
   first_name_kana: 'ダイスケ',
   postcode: '3969994',
   address: '山口県山口山の中458-96',
   phone_number: '020177454',
   is_deleted: false
   )


Genre.create!(
   name: 'ケーキ',
   is_active: 'true'
)

Genre.create!(
   name: 'マドレーヌ',
   is_active: 'true'
)
Genre.create!(
   name: 'クッキー',
   is_active: true
)

Genre.create!(
   name: 'マフィン',
   is_active: true
)

Genre.create!(
   name: 'アイスケーキ',
   is_active: true
)

Item.create!(
   genre_id: 1,
   name: 'チョコケーキ',
   discription: '1口食べたら手が止まらなくなる、nagano cake1番の人気メニューです。',
   price_without_tax: 4500,
   image: open("./db/fixtures/cake.jpg"),
   is_active: true
)
Item.create!(
   genre_id: 1,
   name: 'フラワーケーキ',
   discription: '見た目も味もゴージャス！！女子会向けの1品です。',
   price_without_tax: 4200,
   image: open("./db/fixtures/cake2.jpg"),
   is_active: true
)
Item.create!(
   genre_id: 1,
   name: 'チーズケーキ',
   discription: '熟成チーズを使用したしっとりチーズケーキ。丁度いい甘さが人気です。',
   price_without_tax: 5200,
   image: open("./db/fixtures/cheese.jpg"),
   is_active: true
)
Item.create!(
   genre_id: 4,
   name: 'チョコマフィン',
   discription: '外はサクサク中はふわっふわ、おやつにいかがですか？',
   price_without_tax: 700,
   image: open("./db/fixtures/muffin.jpg"),
   is_active: true
)
Item.create!(
   genre_id: 4,
   name: 'マフィンケーキ',
   discription: 'マフィンとケーキのハーフ。何とも言えない味にはまる人続出。',
   price_without_tax: 900,
   image: open("./db/fixtures/cake1.jpg"),
   is_active: false
)
Item.create!(
   genre_id: 3,
   name: 'フルーツクッキー',
   discription: 'ドライフルーツとクッキーの夢のコラボ。非常に面白い味が楽しめます。',
   price_without_tax: 350,
   image: open("./db/fixtures/cukky.jpg"),
   is_active: true
)
Item.create!(
   genre_id: 1,
   name: 'キャラメルケーキ',
   discription: '甘い！！！！でもうまい！！とにかく食べてみてください！',
   price_without_tax: 3900,
   image: open("./db/fixtures/cake3.jpg"),
   is_active: false
)
Item.create!(
   genre_id: 1,
   name: 'アートケーキ',
   discription: 'とても個性的なケーキ！もらったら嬉しいですね。ぜひどうぞ。',
   price_without_tax: 6200,
   image: open("./db/fixtures/cake4.jpg"),
   is_active: true
)
Item.create!(
   genre_id: 3,
   name: 'チョコクッキー',
   discription: 'サクサクの食感がたまらない、甘さが控えめなのでバクバク食べれます。',
   price_without_tax: 250,
   image: open("./db/fixtures/cukky2.jpg"),
   is_active: true
)
Item.create!(
   genre_id: 1,
   name: 'パンプキンケーキ',
   discription: '季節外れですって？そんなことはありません。パンプキンの甘さを100％だしきりました。',
   price_without_tax: 4200,
   image: open("./db/fixtures/cake5.jpg"),
   is_active: true
)
Item.create!(
   genre_id: 1,
   name: 'ninjaケーキ',
   discription: 'デザインも味もどちらもレベルが高い。チョコ細工の忍者を口の中で楽しんでください。',
   price_without_tax: 1400,
   image: open("./db/fixtures/cake7.jpg"),
   is_active: true
)
Item.create!(
   genre_id: 1,
   name: 'チョコケーキ',
   discription: 'フルーツとチョコの相性がとんでまない。味の宝石箱じゃぁぁ～～！',
   price_without_tax: 5200,
   image: open("./db/fixtures/cake8.jpg"),
   is_active: true
)