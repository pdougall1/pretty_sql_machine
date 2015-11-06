require 'delegate'

class SqlDecorator < SimpleDelegator

  def initialize(sql_phrases)
    @sql_phrases = sql_phrases
    add_syntax_highlighting
    super(@sql_phrases)
  end

  def add_syntax_highlighting
    @sql_phrases.map! { |phrase|
      Pygments.highlight(phrase, style: 'vim', lexer: 'sql', formatter: 'console')
    }
  end
end
