class QuoteVersion < ActiveRecord::Base

  POSSIBLE_LANGUAGES = %w[ru en de]

  belongs_to :quote

  validates_inclusion_of :language, :in => POSSIBLE_LANGUAGES

end
