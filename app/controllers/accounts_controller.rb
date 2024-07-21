class AccountsController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  def index

    @accounts = policy_scope(Account)
    # authorize @accounts
  end


end
