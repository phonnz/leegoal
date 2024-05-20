defmodule Leegoal.Documents.Document do
  defstruct [:id, :title, :content]
  alias Leegoal.Documents.Words
  @default_time_to_create 1_000

  def new do
    Process.sleep(@default_time_to_create)

    __MODULE__.__struct__(
      id: new_id(),
      title: new_title(),
      content: new_content()
    )
  end

  def new_id, do: DateTime.utc_now() |> DateTime.to_unix()

  def new_content() do
    Words.new_content()
  end

  def new_title() do
    Words.new_word()
  end
end
