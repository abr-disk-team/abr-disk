# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# アドミンユーザー
User.create!(
	[
		{
			admin: true,
			email: "test@test.com",
			password: "111111",
			last_name: "山田",
			first_name: "テスト",
			last_name_kana: "やまだ",
			first_name_kana: "てすと",
			phone_number: "0368694700",
			postcode: "1500041",
			prefecture: "東京都",
			city: "渋谷区神南",
			block: "１丁目１９−１１",
			building: "パークウェースクエア`2 4階"
		},
		{
			email: "user@user.com",
			password: "222222",
			last_name: "ユーザー",
			first_name: "太郎",
			last_name_kana: "ゆーざー",
			first_name_kana: "たろう",
			phone_number: "0368694700",
			postcode: "1500041",
			prefecture: "東京都",
			city: "渋谷区神南",
			block: "１丁目１９−１１",
			building: "パークウェースクエア`2 4階"
		},
	]

)
Genre.create!(
	[{genre: "Jポップ"},{genre: "ヒップホップ"},{genre: "ROCK"},{genre: "R&B"},{genre: "Kポップ"},{genre: "演歌"},{genre: "その他"}]
)
Label.create!(
	[{label: "ワーナーミュージック ジャパン"},{label: "ソニー・ミュージックエンタテインメント"},{label: "JYPエンターテインメント"},{label: "ユニバーサルミュージック"},{label: "エイベックス・グループ"},{label: "キングレコード"}]
)
Artist.create!(
	[{artist: "TWICE"},{artist: "MOMOLAND"},{artist: "少女時代"},{artist: "IZ*ONE	"},{artist: "BLACKPINK"},{artist: "KARA"}]
)

