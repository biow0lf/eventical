module StubCurrentCharacterHelper
  def current_character
    controller.send(:current_character)
  end

  def stub_current_character_with(character)
    allow(controller).to receive(:signed_in?).and_return(true)
    allow(controller).to receive(:current_character).and_return(character)
  end

  def stub_current_character
    build_stubbed(:character).tap do |character|
      stub_current_character_with(character)
    end
  end
end

RSpec.configure do |config|
  config.include StubCurrentCharacterHelper, type: :controller
end
