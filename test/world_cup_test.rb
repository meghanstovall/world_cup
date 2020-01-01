require 'minitest/autorun'
require 'minitest/pride'
require './lib/world_cup'
require './lib/team'
require './lib/player'

class WorldCupTest < MiniTest::Test

  def test_it_exists
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)

    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)

    world_cup = WorldCup.new(2018, [france, croatia])

    assert_instance_of WorldCup, world_cup
  end

  def test_it_has_attributes
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)

    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)

    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal 2018, world_cup.year
    assert_equal [france, croatia], world_cup.teams
  end

  def test_active_players_by_position
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)

    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)

    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal [pogba, modric], world_cup.active_players_by_position("midfielder")

    croatia.eliminated = true

    assert_equal [pogba], world_cup.active_players_by_position("midfielder")
  end

  def test_can_sort_all_players_by_position
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)

    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)

    world_cup = WorldCup.new(2018, [france, croatia])

    expected = {"forward" => [mbappe], "midfielder" => [pogba, modric], "defender" => [vida]}

    assert_equal expected, world_cup.all_players_by_position
  end
end
