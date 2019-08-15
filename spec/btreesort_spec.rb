require 'spec_helper'

RSpec.describe BTreeSort, type: :model do
  describe 'btree sort should work' do
    it 'should order the array' do
      expected = [1, 4, 6, 7, 9, 10, 14]
      array = [7, 4, 9, 1, 6, 14, 10]
      expect(BTreeSort.sort(array)).to eq expected
    end

    it 'should handle duplicate values' do
      expected = [1, 1, 2, 2, 3, 3, 3, 7, 7, 7, 7]
      array = [7, 1, 2, 7, 3, 3, 1, 2, 3, 7, 7]
      expect(BTreeSort.sort(array)).to eq expected
    end

    it 'should handle empty input' do
      expected = []
      array = []
      expect(BTreeSort.sort(array)).to eq expected
    end

	it 'should handle single element input' do
      expected = [1]
      array = [1]
      expect(BTreeSort.sort(array)).to eq expected
    end

    it 'should handle negative values' do
      expected = [-10, -5, -1, 2, 3, 5, 6, 10]
      array = [5, -5, 2, -10, 6, 3, 10, -1]
      expect(BTreeSort.sort(array)).to eq expected
    end

    it 'should handle floats' do
      expected = [-15, -14.7, -7.8, -0.5, 0, 0.1, 0.7, 1, 5, 5.3, 6]
      array = [0.1, -0.5, 0.7, 5.3, -7.8, 1, 5, 6, -15, -14.7, 0]
      expect(BTreeSort.sort(array)).to eq expected
    end

    it 'should handle strings' do
      expected = ['A', 'Cat', 'FoO', 'WORLD', 'Zebra', 'a', 'bAr', 'dog', 'hello', 'yeet', 'yolo']
      array = ['hello', 'WORLD', 'A', 'a', 'Zebra', 'Cat', 'dog', 'FoO', 'bAr', 'yolo', 'yeet']
      expect(BTreeSort.sort(array)).to eq expected
    end
  end
end