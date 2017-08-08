class AccountsRewards < ApplicationRecord
  belongs_to :account
  belongs_to :reward
end
