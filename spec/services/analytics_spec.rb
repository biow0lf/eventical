require "rails_helper"

describe Analytics do
  let(:analytics_instance) { Analytics.new(character) } # rubocop:disable Metrics/LineLength
  let(:character) { build_stubbed(:character) }

  describe "#track_account_created" do
    it "tracks that a new account was created" do
      analytics_instance.track_account_created

      expect(analytics).to have_tracked("Account created").
        for_character(character).
        with_properties(label: character.name, category: "Accounts")
    end
  end

  describe "#track_access_token_revoked" do
    it "tracks that an access token has been revoked" do
      analytics_instance.track_access_token_revoked

      expect(analytics).to have_tracked("Access token revoked").
        for_character(character).
        with_properties(label: character.name, category: "Calendars")
    end
  end

  describe "#track_refresh_token_voided" do
    it "tracks that ESI‘s refresh token has been voided" do
      analytics_instance.track_refresh_token_voided

      expect(analytics).to have_tracked("Refresh token voided").
        for_character(character).
        with_properties(label: character.name, category: "ESI")
    end
  end
end
