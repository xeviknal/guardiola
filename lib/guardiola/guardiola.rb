# encoding: utf-8

module Guardiola
  class << self
    attr_accessor :api_key, :base_url
  end

  self.api_key = "b6553e9281b038ad9c817246cc01bd51"
  self.base_url = "http://resultados-futbol.com/api/key=#{self.api_key}&format=json&"
end
