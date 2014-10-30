FactoryGirl.define do
  sequence :player do |n|
    "player#{n}".bytes.join
  end

  sequence :year do |n|
    2010 + n.to_i
  end

  sequence :league do |n|
    'A'.next
  end

  factory :batting, class: BaseballStats::Batting do
    player_id             { generate(:player) }
    year_id               { generate(:year) }
    league                { generate(:league) }
    team_id               { rand(200) }
    appearances           { rand(200) }
    at_bats               { rand(200) }
    runs_scored           { rand(200) }
    hits                  { rand(200) }
    doubles               { rand(200) }
    triples               { rand(200) }
    home_runs             { rand(200) }
    runs_batted_in        { rand(200) }
    stolen_bases          { rand(200) }
    times_caught_stealing { rand(200) }
  end

  factory :player, class: BaseballStats::Player do
    birth_year { generate(:year) }
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
  end
end
