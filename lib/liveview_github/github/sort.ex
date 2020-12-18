defmodule LiveviewGithub.Github.Sort do
  @moduledoc """
  handles sorting of elements based on their index
  """

  @doc """
  Swap the index of repositories
  """
  def update_index(repos, new_index, old_index) do
    new_index_repo = Enum.at(repos, new_index)
    old_index_repo = Enum.at(repos, old_index)

    List.replace_at(repos, new_index, old_index_repo)
    |> List.replace_at(old_index, new_index_repo)
  end

end
