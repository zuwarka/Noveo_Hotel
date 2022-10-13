# frozen_string_literal: true

module Admin
  class PagesController < ApplicationController
    before_action :authenticate_user!
    def dashboard; end
  end
end
