defmodule LeegoalWeb.DocumentLive.Index do
  use LeegoalWeb, :live_view

  alias Leegoal.Documents
  alias Leegoal.Documents.Document

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> stream(:documents, Documents.list_documents())
     |> assign(:search_term, "")}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Documents")
    |> assign(:document, nil)
  end

  @impl true
  def handle_info({LeegoalWeb.DocumentLive.FormComponent, {:saved, document}}, socket) do
    {:noreply, stream_insert(socket, :documents, document)}
  end
end
