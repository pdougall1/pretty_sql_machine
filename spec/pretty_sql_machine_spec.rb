require 'spec_helper'

describe 'loading the gem' do
  let(:ar_object) { double('ActiveRecord::Relation', { to_sql: sql_string }) }
  let(:sql_string) { "SELECT \"projects\".* FROM \"projects\" INNER JOIN \"project_user_roles\" ON \"projects\".\"id\" = \"project_user_roles\".\"project_id\" WHERE \"project_user_roles\".\"user_id\" = 1" }
  let(:expected_output) { "\n\n\e[34mSELECT\e[39;49;00m \e[39;49;00mprojects\e[39;49;00m.\e[39;49;00m*\e[39;49;00m\n\e[34mFROM\e[39;49;00m \e[39;49;00mprojects\e[39;49;00m\n\e[34mINNER\e[39;49;00m \e[39;49;00m\e[34mJOIN\e[39;49;00m \e[39;49;00mproject_user_roles\e[39;49;00m\n\e[34mON\e[39;49;00m \e[39;49;00mprojects\e[39;49;00m.\e[39;49;00mid\e[39;49;00m \e[39;49;00m=\e[39;49;00m \e[39;49;00mproject_user_roles\e[39;49;00m.\e[39;49;00mproject_id\e[39;49;00m\n\e[34mWHERE\e[39;49;00m \e[39;49;00mproject_user_roles\e[39;49;00m.\e[39;49;00muser_id\e[39;49;00m \e[39;49;00m=\e[39;49;00m \e[39;49;00m\e[34m1\e[39;49;00m\n\n\n" }
  subject(:psm) { PrettySqlMachine.prettify(ar_object) }
  it 'outputs the pretty sql' do
    expect{psm}.to output(expected_output).to_stdout
  end
end
