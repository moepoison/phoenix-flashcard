defmodule Cardserver.Flashcard do
  require Logger
  use Cardserver.Web, :model

  schema "flashcards" do
    field :words, :string
    field :definition, :string
    field :pronounciation, :string
    field :import_date, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:words, :definition, :pronounciation, :import_date])
    |> validate_required([:words, :definition, :pronounciation])
    |> unique_constraint(:words)
  end

  def create(param) do
    changeset(%Cardserver.Flashcard{}, param)
    |> put_change(:words, param["words"])
    |> put_change(:definition, param["definition"])
    |> Cardserver.Repo.insert()
  end
end
