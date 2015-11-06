require 'spec_helper'
require 'yaml'

describe SqlPhrases do
  let(:ar_object) { double('ActiveRecord::Relation', { to_sql: sql_string }) }
  let(:sql_string) { "SELECT \"projects\".* FROM \"projects\" INNER JOIN \"project_user_roles\" ON \"projects\".\"id\" = \"project_user_roles\".\"project_id\" WHERE \"project_user_roles\".\"user_id\" = 1" }
  let(:expeced_collection) { YAML.load_file("spec/fixtures/sql_phrases.yml") }
  subject(:phrases) { described_class.new(ar_object) }
  it { is_expected.to match_array expeced_collection }

  context 'when being passed something that does not know to_sql' do
    let(:ar_object) { sql_string }
    it 'throws an error when can not call to_sql' do
      expect{ phrases }.to raise_error(ArgumentError)
    end
  end
end
