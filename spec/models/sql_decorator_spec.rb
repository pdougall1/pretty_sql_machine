require 'spec_helper'

describe SqlDecorator do
  let(:sql_phrases) { YAML.load_file("spec/fixtures/sql_phrases.yml") }
  subject(:sql) { described_class.new(sql_phrases) }
  it 'returns some phraseas' do
    expect(sql).to eq sql_phrases
  end
end
