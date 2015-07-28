# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Categories

networks = Category.create(name: 'networks', color: '#C9CF31').id
security = Category.create(name: 'security', color: '#F8931F').id
unix = Category.create(name: 'unix', color: '#E1E0B2').id
space = Category.create(name: 'space', color: '#B1D1E0 ').id

# Sources

michigan_hash = {
  name: 'University of Michigan - Internet History, Technology, and Security',
  link: 'https://www.coursera.org/learn/internet-history',
  description: 'Курс на курсере про историю интернета.'
}

stall_hash = {
  name: 'Clifford Stall - The Cuckoo\'s egg',
  link: '',
  description: 'Книжка про то, как Столл выслеживал немецких хакеров.'
}

ghost_hash = {
  name: 'Kevin Mitnick - Ghost in the wires',
  link: '',
  description: 'Автобиография Митника.'
}

michigan = Source.create(michigan_hash).id
stall    = Source.create(stall_hash).id
ghost    = Source.create(ghost_hash).id

# Events

events = [

  # {
  #   year: ,
  #   month: ,
  #   day: ,
  #   name: '',
  #   description: '',
  #   source_id:
  #   category_ids: []
  # },


  {
    year: 1969,
    month: 10,
    day: 29,
    name: 'Первые два пакета: lo and behold',
    description: '',
    source_id: michigan,
    category_ids: [networks]
  },
  
  {
    year: 1991,
    month: 12,
    day: 12,
    name: 'Первый веб-сервер в Америке',
    description: 'Доктор Paul Kunz, Stanford Linear Accelerator. 300000 Научных статей. Первый поисковик в сети.',
    source_id: michigan,
    category_ids: [networks]
  },

  {
    year: 1994,
    month: 4,
    day: 4,
    name: 'Основана компания Netscape',
    description: 'Люди, которые делали Mosaic, решили уйти в коммерцию.',
    source_id: michigan,
    category_ids: [networks]
  },

  {
    year: 1972,
    month: 10,
    day: nil,
    name: 'Первая демонстрация ARPAnet',
    description: '',
    source_id: michigan,
    category_ids: [networks]
  },

  {
    year: 1978,
    month: nil,
    day: nil,
    name: 'Пережив 4 итерации дизайн/имплементация ARPAnet признан стабильным',
    description: '',
    source_id: michigan,
    category_ids: [networks]
  },


  {
    year: 1989,
    month: 5,
    day: 2,
    name: 'German authorities charged five people with espionage: Pengo, Hagbard, Peter Carl, Dirk Bresinsky, and Markus Hess',
    description: '',
    source_id: stall,
    category_ids: [security]
  },

  {
    year: 1980,
    month: nil,
    day: nil,
    name: 'Bill Joy wrote Unix screen editor VI',
    description: '',
    source_id: stall,
    category_ids: [unix]
  },

]

for event in events
  Event.create(
    year: event[:year],
    month: event[:month],
    day: event[:day],
    name: event[:name],
    source_id: event[:source_id],
    category_ids: event[:category_ids],
    description: event[:description]
  )
end
