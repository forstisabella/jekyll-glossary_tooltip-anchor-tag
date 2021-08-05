# frozen_string_literal: true

require "jekyll-glossary_tooltip/options_parser"
require "jekyll-glossary_tooltip/errors"

P= Jekyll::GlossaryTooltip::OptionsParser
E = Jekyll::GlossaryTooltip::Errors

RSpec.describe Jekyll::GlossaryTooltip::OptionsParser do
  context "when providing valid term name" do
    it "parsing works" do
      actual = P.parse("a_term")
      expected = {
        term_query: "a_term",
        display: nil,
      }
      expect(actual).to eq(expected)
    end
  end

  context "when providing no term name query" do
    it "parsing raises error" do
      expect { P.parse("   ") }.to raise_error(E::OptionsNoTermNameInTag)

    end
  end

  context "when providing valid term name and valid arg" do
    it "parsing works" do
      actual = P.parse("a_term, display: FancyName ")
      expected = {
        term_query: "a_term",
        display: "FancyName",
      }
      expect(actual).to eq(expected)
    end
  end

  context "when providing valid term name and invalid arg" do
    it "parsing raises error" do
      expect { P.parse("a_term, unknownArg: what") }.to raise_error(E::OptionsUnknownTagArgument)

    end
  end

  context "when providing invalid format" do
    it "parsing raises error" do
      expect { P.parse("a_term, display = FancyName") }.to raise_error(E::OptionsBadTagArgumentFormat)

    end
  end
end
