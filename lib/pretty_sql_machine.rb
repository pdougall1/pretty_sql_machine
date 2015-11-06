require "pretty_sql_machine/version"
require "models/sql_phrases"
require 'pygments'

module PrettySqlMachine
  def self.prettify sql_string
    phrases = SqlPhrases.new(sql_string)
    puts ''
    puts ''
    phrases.each { |phrase| puts phrase }
    puts ''
    puts ''
    phrases
  end
end
