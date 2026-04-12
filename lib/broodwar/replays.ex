defmodule Broodwar.Replays do
  @moduledoc """
  Context for replay parsing and analysis.
  """

  @doc """
  Parse a replay from raw `.rep` file binary data.

  Returns `{:ok, replay}` with a map containing:
  - `header` — map name, players, duration, game type, etc.
  - `build_order` — list of build/train/research/upgrade actions with timestamps
  - `player_apm` — per-player APM and EAPM
  - `command_count` — total number of commands in the replay

  ## Examples

      iex> {:ok, replay} = Broodwar.Replays.parse_replay(binary_data)
      iex> replay.header.map_name
      "Polypoid 1.65"
  """
  @spec parse_replay(binary()) :: {:ok, map()} | {:error, String.t()}
  def parse_replay(data) when is_binary(data) do
    BroodwarNif.ReplayParser.parse(data)
  end

  @doc """
  Parse a replay file from disk.
  """
  @spec parse_replay_file(Path.t()) :: {:ok, map()} | {:error, String.t()}
  def parse_replay_file(path) do
    case File.read(path) do
      {:ok, data} -> parse_replay(data)
      {:error, reason} -> {:error, "failed to read file: #{reason}"}
    end
  end
end
