FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    fastname {'田中'}
    secondname {'太郎'}
    fastname_kana {'ヤマダ'}
    secondname_kana {'タロウ'}
    email {'aaa@aaa'}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end
