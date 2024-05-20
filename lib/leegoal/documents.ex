defmodule Leegoal.Documents do
  alias Leegoal.Documents.Document

  @moduledoc """
  The Documents context.
  """

  @doc """
  Returns the list of documents.


  ## Examples

      iex> list_documents()
      [%Document{}, ...]

  """
  def list_documents do
    Leegoal.Documents.Worder.list_all()
  end

  def get_docs() do
    []
  end

  def new, do: Document.new()
end
