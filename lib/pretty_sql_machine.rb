require "pretty_sql_machine/version"
require "models/sql_phrases"
require 'pygments'

module PrettySqlMachine
  def self.prettify sql_string
    phrases = SqlPhrases.new(sql_string)
    puts ''
    puts ''
    phrases.each { |phrase| puts Pygments.highlight(phrase, lexer: 'sql', formatter: 'console', style: 'monokai') }
    puts ''
    puts ''
    phrases
  end
end
