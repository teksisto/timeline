# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


events = [
  [1969, 10 , 29, "Первые два пакета: lo and behold", ""],

  [1991, 12 , 12, "Первый веб-сервер в Америке",
   "Доктор Paul Kunz, Stanford Linear Accelerator. 300000 Научных статей. Первый поисковик в сети."],

  [1994, 4, 4, "Основана компания Netscape",
   "Люди, которые делали Mosaic, решили уйти в коммерцию."],

  [1972, 10, nil, "Первая демонстрация ARPAnet", ""],

  [1978, nil, nil, "Пережив 4 итерации дизайн/имплементация ARPAnet признан стабильным",
   ""]
]

for event in events
  Event.create(
    year: event[0],
    month: event[1],
    day: event[2],
    name: event[3],
    description: event[4]
  )
end

