module Guardiola
  class League
    attr_accessor :id, :name, :country, :current_round, :flag, :group_code, :order,
      :phase, :playoff, :total_group, :total_rounds, :year

    def initialize(id, name, country, year, total_rounds, total_group, current_round)

      self.id = id
      self.name = name
      self.country = country
      self.current_round = current_round
      self.total_group = total_group
      self.total_rounds = total_rounds
      self.year = year
    end

    class << self
      def all
        find
      end

      def where(opts = {})
        find(opts)
      end

      private

      def build(json_league = {})
        League.new(json_league["id"], json_league["name"], json_league["country"], json_league["year"],
          json_league["total_rounds"], json_league["total_group"], json_league["current_round"])
      end

      def json_leagues(opts = {})
        JSON.parse(Net::HTTP.get(URI.parse Guardiola::Path.leagues_path(opts)))
      end

      def find(opts = {})
        json_leagues(opts)["league"].map do |league|
          build(league)
        end
      end
    end
  end
end
