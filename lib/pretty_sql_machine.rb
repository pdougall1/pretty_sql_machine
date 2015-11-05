require "pretty_sql_machine/version"
require "models/sql_phrases"
require 'pygments'

module PrettySqlMachine
  def self.prettify sql_string
    phrases = SqlPhrases.new(sql_string)
    puts ''
    puts ''
    phrases.each { |phrase| puts Pygments.highlight(phrase, style: 'vim', lexer: 'sql', formatter: 'console') }
    puts ''
    puts ''
    phrases
  end
end
