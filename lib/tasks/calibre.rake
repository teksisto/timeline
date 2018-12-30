require 'rexml/document'

namespace :calibre do

  desc "Import sources and authors from Calibre library."
  task :import => :environment do

    # book_category = Category.where(label: 'book').first

    library_path = '/media/teksisto/22E6D16331B47114/library/'

    for book_path in Dir[File.join(library_path, "*/*/")]
      puts '--------------'
      puts book_path

      metadata_path = File.join(book_path, 'metadata.opf')
         cover_path = File.join(book_path, 'cover.jpg')
          file_path = Dir[File.join(book_path, '*.{pdf,epub}')].first


      metadata = REXML::Document.new(IO.read(metadata_path))
      metadata = metadata.elements.to_a('package/metadata').first

      authors = []
      metadata.elements.each('dc:creator') do |creator|
        authors << creator.text
      end
      authors = authors.map do |author|
        Person.find_or_create_by(label: author)
      end

      # p authors

      label = metadata.elements.to_a('dc:title').first.text

      if label.present?      &&
         file_path.present?  && File.exists?(file_path) &&
         cover_path.present? && File.exists?(cover_path)

        begin
          source_attributes = {
            label: label,
            authors: authors
            # category: book_category
          }

          source = Source.new(source_attributes)

          source.save

          source.file.attach(
            io: File.open(file_path),
            filename: File.basename(file_path)
          )

          # source.cover.attach(
          #   io: File.open(cover_path),
          #   filename: File.basename(cover_path)
          # )

        rescue => exception
          byebug
        end

      else
        puts 'Fuck.'
      end
    end

  end

end
