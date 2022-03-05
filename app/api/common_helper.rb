# frozen_string_literal: true
module CommonHelper
  extend Grape::API::Helpers

  def format_date(time)
    time&.strftime("%d/%m/%Y")
  end

  def get_hash(title, message)
    { title: title, message: message }
  end
end
