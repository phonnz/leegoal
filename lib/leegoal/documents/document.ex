defmodule Leegoal.Documents.Document do
  defstruct [:title, :content]

  @default_time_to_create 1_000

  def new do
    Process.sleep(@default_time_to_create)
    __MODULE__.__struct__(title: new_title(), content: new_content())
  end

  def new_content() do
    "new content"
  end

  def new_title() do
    "some title"
  end
end
