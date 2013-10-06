module Guardiola
  class Path
    def leagues_path(opts = {})
      country = opts.fetch :country, :ue
      top = opts.fetch :top, :yes

      Guardiola.base_url + "country=#{country}&top=#{top}"
    end
  end
end
