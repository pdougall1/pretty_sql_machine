require 'spec_helper'

describe 'loading the gem' do
  let(:ar_object) { double('ActiveRecord::Relation', { to_sql: sql_string }) }
  let(:sql_string) { "SELECT \"projects\".* FROM \"projects\" INNER JOIN \"project_user_roles\" ON \"projects\".\"id\" = \"project_user_roles\".\"project_id\" WHERE \"project_user_roles\".\"user_id\" = 1" }
  let(:expected_output) { "\"\"\n\"\"\n\"SELECT projects.*\"\n\"FROM projects\"\n\"INNER JOIN project_user_roles\"\n\"ON projects.id = project_user_roles.project_id\"\n\"WHERE project_user_roles.user_id = 1\"\n\"\"\n\"\"\n" }
  subject(:psm) { PrettySqlMachine.prettify(ar_object) }
  it 'outputs the pretty sql' do
    expect{psm}.to output(expected_output).to_stdout
  end
end
