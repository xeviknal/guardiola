require 'spec_helper'

describe Guardiola::League do
  describe "#all method" do
    before do
      FakeWeb.register_uri(:get, Guardiola::Path.leagues_path, body: open_asset("leagues_default.json"))
    end

    it "return current European and TOP leagues" do
      Guardiola::League.all.tap do |leagues|
        leagues.count.should == 6
      end
    end
  end

  describe "#where method" do
    context "when country is 'es'" do
      before do
        FakeWeb.register_uri(:get, Guardiola::Path.leagues_path(country: "es"), body: open_asset("leagues_es.json"))
      end

      it "return current spanish leagues" do
        Guardiola::League.where(country: "es").tap do |leagues|
          leagues.count.should == 5
          leagues.all? { |league| league.country == "es" }.should == true
        end
      end
    end
  end
end
