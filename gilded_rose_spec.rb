# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'

require_relative './gilded_rose'

class GildedRoseTest < MiniTest::Test
  def test_normal_before_sell_date
    gilded_rose = GildedRose.new(name: 'normal', days_remaining: 5, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 4
    assert_equal gilded_rose.quality, 9
  end

  def test_normal_on_sell_date
    gilded_rose = GildedRose.new(name: 'normal', days_remaining: 0, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -1
    assert_equal gilded_rose.quality, 8
  end

  def test_normal_after_sell_date
    gilded_rose = GildedRose.new(name: 'normal', days_remaining: -10, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -11
    assert_equal gilded_rose.quality, 8
  end

  def test_normal_of_zero_quality
    gilded_rose = GildedRose.new(name: 'normal', days_remaining: 5, quality: 0)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 4
    assert_equal gilded_rose.quality, 0
  end

  def test_brie_before_sell_date
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: 5, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 4
    assert_equal gilded_rose.quality, 11
  end

  def test_brie_with_max_quality
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: 5, quality: 50)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 4
    assert_equal gilded_rose.quality, 50
  end

  def test_brie_on_sell_date
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: 0, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -1
    assert_equal gilded_rose.quality, 12
  end

  def test_brie_on_sell_date_near_max_quality
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: 0, quality: 49)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -1
    assert_equal gilded_rose.quality, 50
  end

  def test_brie_on_sell_date_with_max_quality
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: 0, quality: 50)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -1
    assert_equal gilded_rose.quality, 50
  end

  def test_brie_after_sell_date
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: -10, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -11
    assert_equal gilded_rose.quality, 12
  end

  def test_brie_after_sell_date_with_max_quality
    gilded_rose = GildedRose.new(name: 'Aged Brie', days_remaining: -10, quality: 50)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -11
    assert_equal gilded_rose.quality, 50
  end

  def test_sulfuras_before_sell_date
    gilded_rose = GildedRose.new(name: 'Sulfuras, Hand of Ragnaros', days_remaining: 5, quality: 80)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 5
    assert_equal gilded_rose.quality, 80
  end

  def test_sulfuras_on_sell_date
    gilded_rose = GildedRose.new(name: 'Sulfuras, Hand of Ragnaros', days_remaining: 0, quality: 80)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 0
    assert_equal gilded_rose.quality, 80
  end

  def test_sulfuras_after_sell_date
    gilded_rose = GildedRose.new(name: 'Sulfuras, Hand of Ragnaros', days_remaining: -10, quality: 80)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -10
    assert_equal gilded_rose.quality, 80
  end

  def test_backstage_long_before_sell_date
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 11, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 10
    assert_equal gilded_rose.quality, 11
  end

  def test_backstage_long_before_sell_date_at_max_quality
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 11, quality: 50)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 10
    assert_equal gilded_rose.quality, 50
  end

  def test_backstage_medium_close_to_sell_date_upper_bound
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 10, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 9
    assert_equal gilded_rose.quality, 12
  end

  def test_backstage_medium_close_to_sell_date_upper_bound_at_max_quality
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 10, quality: 50)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 9
    assert_equal gilded_rose.quality, 50
  end

  def test_backstage_medium_close_to_sell_date_lower_bound
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 6, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 5
    assert_equal gilded_rose.quality, 12
  end

  def test_backstage_medium_close_to_sell_date_lower_bound_at_max_quality
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 6, quality: 50)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 5
    assert_equal gilded_rose.quality, 50
  end

  def test_backstage_very_close_to_sell_date_upper_bound
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 5, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 4
    assert_equal gilded_rose.quality, 13
  end

  def test_backstage_very_close_to_sell_date_upper_bound_at_max_quality
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 5, quality: 50)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 4
    assert_equal gilded_rose.quality, 50
  end

  def test_backstage_very_close_to_sell_date_lower_bound
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 1, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 0
    assert_equal gilded_rose.quality, 13
  end

  def test_backstage_very_close_to_sell_date_lower_bound_at_max_quality
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 1, quality: 50)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 0
    assert_equal gilded_rose.quality, 50
  end

  def test_backstage_on_sell_date
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: 0, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -1
    assert_equal gilded_rose.quality, 0
  end

  def test_backstage_after_sell_date
    gilded_rose = GildedRose.new(name: 'Backstage passes to a TAFKAL80ETC concert', days_remaining: -10, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -11
    assert_equal gilded_rose.quality, 0
  end

  def test_conjured_before_sell_date
    gilded_rose = GildedRose.new(name: 'Conjured Mana Cake', days_remaining: 5, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 4
    assert_equal gilded_rose.quality, 8
  end

  def test_conjured_before_sell_date_at_zero_quality
    gilded_rose = GildedRose.new(name: 'Conjured Mana Cake', days_remaining: 5, quality: 0)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, 4
    assert_equal gilded_rose.quality, 0
  end

  def test_conjured_on_sell_date
    gilded_rose = GildedRose.new(name: 'Conjured Mana Cake', days_remaining: 0, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -1
    assert_equal gilded_rose.quality, 6
  end

  def test_conjured_on_sell_date_at_zero_quality
    gilded_rose = GildedRose.new(name: 'Conjured Mana Cake', days_remaining: 0, quality: 0)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -1
    assert_equal gilded_rose.quality, 0
  end

  def test_conjured_after_sell_date
    gilded_rose = GildedRose.new(name: 'Conjured Mana Cake', days_remaining: -10, quality: 10)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -11
    assert_equal gilded_rose.quality, 6
  end

  def test_conjured_after_sell_date_at_zero_quality
    gilded_rose = GildedRose.new(name: 'Conjured Mana Cake', days_remaining: -10, quality: 0)

    gilded_rose.tick

    assert_equal gilded_rose.days_remaining, -11
    assert_equal gilded_rose.quality, 0
  end
end
