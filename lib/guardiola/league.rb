module Guardiola
  class League
    attr_accessor :id, :name, :country, :current_round, :flag, :group_code, :order,
      :phase, :playoff, :total_group, :total_rounds, :year

    def initialize(id, name, country, current_round, flag, group_code, order,
                  phase, playoff, total_group, total_rounds, year)

      self.id = id
      self.name = name
      self.country = country
      self.current_round = current_round
      self.flag = flag
      self.group_code = group_code
      self.order = order
      self.phase = phase
      self.playoff = playoff
      self.total_group = total_group
      self.total_rounds = total_rounds
      self.year = year
    end

    class << self
      def all(opts = {})
        leagues = []

        each_league(opts) do |league|
          leagues << league
        end

        leagues
      end
    end

    private

    def json_leagues
      json_leagues ||= JSON.parse(open(Guardiola::Path.leagues_path))
    end

    def each_league(opts = {})
      json_leagues.each do |json_league|
        yield(json_league)
      end
    end
  end
end
