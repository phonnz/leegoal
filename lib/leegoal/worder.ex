defmodule Leegoal.Documents.Worder do
  use GenServer
  alias Leegoal.Documents
  # Client

  def start_link(default \\ %{}) when is_map(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def push(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def list_all(pid) do
    GenServer.call(pid, :pop)
  end

  # Server (callbacks)

  @impl true
  def init(state) do
    {:ok, state, {:continue, :generate}}
  end

  @impl true
  def handle_continue(:generate, state) do
    Process.send_after(self(), :work, 1_000)
    {:noreply, state}
  end

  @impl true
  def handle_call(:pop, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    new_state = [element | state]
    {:noreply, new_state}
  end

  @impl true
  def handle_info(:work, state) do
    new_document = Documents.new()
    state = Map.put(state, new_document.id, new_document)
    schedule_work()

    {:noreply, state}
  end

  defp schedule_work do
    Process.send_after(self(), :work, 5 * 1000)
  end
end
