require 'spec_helper'
require 'pry'
require_relative '../lib/map'

describe "When finding contiguous shapes on map" do
  let(:shapes) { Map.from_grid(grid).shapes.count }

  context "for a single point" do
    context "which is active" do
      let(:grid) { "*" }

      it "returns one shape" do
        expect(shapes).to eq 1
      end
    end

    context "which is non active" do
      let(:grid) { "." }

      it "returns no shapes" do
        expect(shapes).to eq 0
      end
    end
  end

  context "for multiple points" do
    context "on the same line" do
      let(:grid) { "*.*.*" }

      it "returns three shapes" do
        expect(shapes).to eq 3
      end
    end

    context "with multiple lines" do
      let(:grid) { "*.*\n.*." }

      it "returns three shapes" do
        expect(shapes).to eq 3
      end
    end
  end

  context "with points that are contiguously connected" do
    context "on the same line" do
      let(:grid) { "***.**" }

      it "returns two shapes" do
        expect(shapes).to eq 2
      end
    end
  end
end
