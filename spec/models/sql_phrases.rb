require 'spec_helper'

describe SqlPhrases do
  let(:sql_string) { "SELECT \"projects\".* FROM \"projects\" INNER JOIN \"project_user_roles\" ON \"projects\".\"id\" = \"project_user_roles\".\"project_id\" WHERE \"project_user_roles\".\"user_id\" = 1" }
  let(:expeced_collection) { ["FROM projects", "INNER JOIN project_user_roles", "ON projects.id = project_user_roles.project_id", "SELECT projects.*", "WHERE project_user_roles.user_id = 1"] }
  subject(:phrases) { described_class.new(sql_string) }
  it { is_expected.to match_array expeced_collection }
end
