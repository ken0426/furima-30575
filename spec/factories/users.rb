FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    fastname {'田中'}
    secondname {'太郎'}
    fastname_kana {'ヤマダ'}
    secondname_kana {'タロウ'}
    email {'aaa@aaa.aa'}
    password {'1a1a1a'}
    password_confirmation {password}
    birthday {'2020-11-04'}
  end
end
