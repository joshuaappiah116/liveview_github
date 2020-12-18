defmodule LiveviewGithubWeb.PageLive do
  use LiveviewGithubWeb, :live_view

  require Logger


  @impl true
  def mount(_params, _session, socket) do
    {:ok,
      assign(socket, query: "", results: [], count: 1, error: nil)
    }
  end

  @impl true
  def handle_event("find", %{"data" => %{"name" => name}}, socket) do
    count = socket.assigns.count
    if count < 3 do
      {:noreply, assign(socket, :count, count + 1)}
    else
      case LiveviewGithub.Github.Search.repository_search(name) do
        {:error, _message} ->
          {:noreply, socket}

        {:ok, results} ->
          {:noreply, assign(socket, results: results, data: results)}
      end
    end
  end

  def handle_event("fetch", %{"data" => %{"name" => name}}, socket) do
    case LiveviewGithub.Github.Search.repository_search(name) do
      {:error, _message} ->
        {:noreply, socket}

      {:ok, results} ->
        {:noreply, assign(socket, results: results, data: results)}
    end
  end

  def handle_event("sorted", _params, socket) do
  #  sorted = Sort.update_index(socket.assigns.results, newIndex, oldIndex)
    {:noreply, socket}
  end

end
