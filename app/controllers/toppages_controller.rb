class ToppagesController < ApplicationController
  layout 'application'
  before_action :authenticate_account!, only: :login_check

  def index

  end

  def login_check
    @account = current_account
    pp @account
    binding.pry
  end
end
