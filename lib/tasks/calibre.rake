require 'rexml/document'

namespace :calibre do

  desc "Import sources and authors from Calibre library."
  task import: :environment do

    book_category = Category.where(label: 'book').first

    library_path = '/media/teksisto/22E6D16331B47114/library/'

    for book_path in Dir[File.join(library_path, "*/*/")]
      puts '--------------'

      metadata_path = File.join(book_path, 'metadata.opf')
      cover_path = File.join(book_path, 'cover.jpg')
      file_path = Dir[File.join(book_path, '*.{pdf,epub}')].first


      metadata = REXML::Document.new(IO.read(metadata_path))
      metadata = metadata.elements.to_a('package/metadata').first

      authors = []
      metadata.elements.each('dc:creator') do |creator|
        authors << creator.text
      end

      categories = []
      metadata.elements.each('dc:subject') do |subject|
        categories << subject.text
      end

      label = metadata.elements.to_a('dc:title').first.text

      authors = authors.map do |author|
        Person.find_or_create_by(label: author)
      end



      if label.present?      &&
         authors.present?    &&
         file_path.present?  && File.exists?(file_path) &&
         cover_path.present? && File.exists?(cover_path)

        source_attributes = {
          label: label,
          authors: authors,
          category: book_category
        }

        source = Source.new(source_attributes)

        source.file.attach(
          io: File.open(file_path),
          filename: File.basename(file_path)
        )

        source.cover.attach(
          io: File.open(cover_path),
          filename: File.basename(cover_path)
        )

        source.save

        p source.id
      end
    end

  end

end
