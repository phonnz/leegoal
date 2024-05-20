defmodule Leegoal.DocumentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Leegoal.Documents` context.
  """

  @doc """
  Generate a document.
  """
  def document_fixture(attrs \\ %{}) do
    {:ok, document} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> Leegoal.Documents.create_document()

    document
  end
end
