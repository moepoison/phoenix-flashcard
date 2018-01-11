defmodule Cardserver.Repo.Migrations.CreateFlashcard do
  use Ecto.Migration

  def change do
    create table(:flashcards) do
      add :words, :string
      add :definition, :string
      add :pronounciation, :string
      add :import_date, :string

      timestamps()
    end

    create unique_index(:flashcards, [:words])
  end
end
