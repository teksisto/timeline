# coding: utf-8
require 'gepub'
require 'open-uri'

class EpubBuilder

  def epub_for(source)

    # GEPUB::Book.new do
    #   language 'en'
    #   unique_identifier 'http:/example.jp/bookid_in_url', 'BookID', 'URL'
    #   title 'GEPUB Sample Book'
    #   subtitle 'This book is just a sample'

    #   creator 'KOJIMA Satoshi'

    #   contributors 'Denshobu', 'Asagaya Densho', 'Shonan Densho Teidan', 'eMagazine Torutaru'

    #   date '2012-02-29T00:00:00Z'

    #   ordered {
    #     source.toc.self_and_descendants.map do |t|
    #       add_item(t.name) do |item|
    #         response = open("http://localhost:3000/tocs/#{t.id}").readlines
    #         item.content = StringIO.new(response.join)
    #       end
    #     end
    #   }

    #   generate_epub_stream
    # end
    
    book = GEPUB::Book.new
    book.set_title 'GEPUB Sample Book'

    book.add_ordered_item('name', StringIO.new('<hr>'))
    
    book.generate_epub_stream
  end

  # File.join('./tmp', 'example_test_with_builder.epub')  
  
  # Rails.logger.error(epubfile.inspect.red)
  
  

end
