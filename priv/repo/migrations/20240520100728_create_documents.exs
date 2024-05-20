defmodule Leegoal.Repo.Migrations.CreateDocuments do
  use Ecto.Migration

  def change do
    create table(:documents, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :content, :string

      timestamps(type: :utc_datetime)
    end
  end
end
