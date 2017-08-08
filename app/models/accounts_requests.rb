class AccountsRequests < ApplicationRecord
  belongs_to :account
  belongs_to :request
end
