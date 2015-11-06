require 'delegate'

class SqlPhrases < SimpleDelegator
  def initialize(sql_query, decorator: SqlDecorator)
    begin
      @sql_string = sql_query.to_sql
    rescue NoMethodError
      raise ArgumentError, "#{sql_query} must respont to to_sql."
    end
    decorated_sql = decorator.new(parsed_sql)
    super(decorated_sql)
  end

  def parsed_sql
    full_sql = []
    new_sql  = []
    words = @sql_string.gsub('"', '').split(' ')
    words.each.with_index do |word, i|
      if sql_command?(word) && noncontiguous(word, words[i - 1])
        full_sql << new_sql.join(' ')
        new_sql = [word]
      elsif word == words.last
        new_sql << word
        full_sql << new_sql.join(' ')
      else
        new_sql << word
      end
    end

    full_sql.reject(&:empty?)
  end

  def sql_command?(word)
    (word.upcase == word) && /[a-zA-Z]/.match(word)
  end

  def noncontiguous(word, other_word)
    !(sql_command?(word) && sql_command?(other_word))
  end
end
