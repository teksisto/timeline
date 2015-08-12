# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Category.rebuild!
Category.all.each{|c| c.save}

Toc.rebuild!

Source.all.each{|s| s.save}

org_files = {
  'Дмитрий Жуков — Биология поведения: гуморальные механизмы' => 'misc/zhukov.org',
  'Нассим Николас Талеб — Черный лебедь' => 'misc/taleb.org',
  'Александр Ткачев — Цитатник' => 'misc/quotes.org'
}

for name, file in org_files
  source = Source.where(name: name).first
  source.parse_toc(IO.read(file))
  puts "Imported #{file} into #{name}.".cyan
end
