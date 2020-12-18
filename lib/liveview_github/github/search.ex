defmodule LiveviewGithub.Github.Search do
  @moduledoc """
  Handles all search requests
  """

  @doc """
  Search github and return the top ten repositories that matches the search
  - The sort is ranked by github stars
  """
  def repository_search(name) do
    params = %{q: name, sort: "starts", per_page: 10}
    try do
      case Tentacat.Search.repositories(params) do
        {200, content, _conn} ->
          data = minify_content(content["items"])
          {:ok, data}

        {403, _content, _conn} ->
          {:error, "API rate limit exceeded"}

        {_, _, _} ->
          {:error, "An error occured handling repository search request"}
      end

    rescue
      _error ->
        {:error, "Check your internet connection"}
    end

  end

  #returns only the name and description of the repository
  def minify_content(contents) do
    Enum.map(contents, fn content ->
      content["name"]
    end )
  end
end
