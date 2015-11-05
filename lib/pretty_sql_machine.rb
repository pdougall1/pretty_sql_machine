require "pretty_sql_machine/version"

module PrettySqlMachine
  def self.prettify sql_string
    phrases = SqlPhrases.new(sql_string)
    p ''
    p ''
    phrases.each { |phrase| p phrase }
    p ''
    p ''
    phrases
  end
end
