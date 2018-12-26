# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#
# Some fix for some problem.
# https://stackoverflow.com/questions/49810704
#
Source.__elasticsearch__.create_index!
Source.__elasticsearch__.create_index! force: true
Source.import force: true

Category.rebuild!
Category.all.each{|c| c.save}
Event.all.each{|e| e.save}

Source.rebuild!
Source.all.each{|s| s.save}

org_files = {
  'adafasdf' => 'doc/adafasdf.org',
  'Биология поведения: гуморальные механизмы' => 'misc/zhukov.org',
  'Цитатник' => 'misc/quotes.org'
}

for label, file in org_files
  puts "Processing #{file}"
  source = Source.where(label: label).first
  source.parse_org_mode(IO.read(file))
  puts "Imported #{file} into #{label}."
end
