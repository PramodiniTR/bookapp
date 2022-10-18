class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
end
