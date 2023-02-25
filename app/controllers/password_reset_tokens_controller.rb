class PasswordResetTokensController < ApplicationController

  skip_before_action :authenticate!, only: [:new, :create]

  def new
  end

  def create
  end
end