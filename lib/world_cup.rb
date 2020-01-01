class WorldCup

  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    active_players = []
    @teams.each do |team|
      if !team.eliminated
        active_players << team.players_by_position(position)
      end
    end
    active_players.flatten
  end

  def all_players_by_position
    @teams.reduce({}) do |hash, team|
      team.players.each do |player|
        hash[player.position] = active_players_by_position(player.position)
      end
      hash
    end
  end
  
end
