# coding: utf-8
require 'rexml/document'

$stdout = File.new('quotes.html', 'w')

require 'rexml/document'
xml = REXML::Document.new(File.open("quotes.xml"))
root = xml.elements[1]


puts header = <<TXT
﻿<html>
  <head>

    <title> Дзен и искусство ухода за мотоциклом </title>

    <style>
      body {
        background-color: black;
        color: white;
     
      }
      td {
        width: 50%;
        padding: 20px 40px 20px 40px;
      }
      h1, h2 {
        text-align: center;
      }
      h1 {
        font-size: 40px;
      }
      h2 {
        font-size: 30px;
      }
    </style>

  </head>

  <body>
TXT

for i in root.elements
   puts  '<h1>' + i.attributes['title_ru'] + '</h1>'
  for j in i.elements
    puts '  <h2>' + j.attributes['title_ru'] + '</h2>'
    puts '  <table border="1">'
    for k in j.elements
      if k.name == 'quote'
        puts '    <tr>'
        for y in k.elements
          puts '      <td>'
          if y.text.strip == ''
            puts '&nbsp;'
          else
            text = y.text.gsub("\n\n", "<br /><br />")
            text = text.gsub("--", "&mdash;")
            if y.attributes['page']
              text = text + '<br/><br /> (стр. ' + y.attributes['page'] + ')'
            end
           puts text
          end
          puts '      </td>'
        end
        puts '    </tr>'
      end
    end
    puts '  </table>'
  end
end

puts footer = <<TXT
  </body> 
</html>
TXT

