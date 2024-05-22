defmodule Leegoal.Documents.Worder do
  use GenServer
  alias Leegoal.Documents
  @self __MODULE__

  def start_link(default \\ []) when is_list(default) do
    GenServer.start_link(__MODULE__, default, name: @self)
  end

  def get(terms) do
    GenServer.cast(@self, {:get, terms})
  end

  def list_all() do
    GenServer.call(@self, :list)
  end

  @impl true
  def init(state) do
    {:ok, state, {:continue, :generate}}
  end

  @impl true
  def handle_continue(:generate, state) do
    Process.send_after(self(), :work, 30_000)
    {:noreply, state}
  end

  @impl true
  def handle_call(:list, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call({:get, terms}, _from, state) do
    result_documents = Documents.find(state, terms)
    {:reply, result_documents, state}
  end

  @impl true
  def handle_info(:work, state) do
    new_document = Documents.new()
    state = [new_document | state]
    schedule_work()

    {:noreply, state}
  end

  defp schedule_work do
    Process.send_after(self(), :work, 5 * 1000)
  end
end
