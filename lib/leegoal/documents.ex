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
    |> Enum.take(10)
  end

  def get_docs(terms) do
    Leegoal.Documents.Worder.get_docs(terms)
    |> Enum.take(10)
  end

  def new, do: Document.new()

  def find(documents, param) do
    terms = simple_string(param)

    documents
    |> Enum.filter(
      &(String.contains?(simple_string(&1.title), terms) or
          String.contains?(simple_string(&1.content), terms))
    )
  end

  defp simple_string(term) do
    term
    |> String.normalize(:nfc)
    |> String.downcase()
  end
end
