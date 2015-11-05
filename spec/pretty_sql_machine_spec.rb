require 'spec_helper'
describe 'loading the gem' do
  let(:sql_string) { "SELECT \"projects\".* FROM \"projects\" INNER JOIN \"project_user_roles\" ON \"projects\".\"id\" = \"project_user_roles\".\"project_id\" WHERE \"project_user_roles\".\"user_id\" = 1" }
  subject(:psm) { PrettySqlMachine.prettify(sql_string) }
  it 'outputs the pretty sql' do
    expect{psm}.to output("my message\n").to_stdout
  end
end
