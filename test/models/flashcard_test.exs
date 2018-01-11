defmodule Cardserver.FlashcardTest do
  use Cardserver.ModelCase

  alias Cardserver.Flashcard

  @valid_attrs %{definition: "some definition", import_date: "some import_date", pronounciation: "some pronounciation", words: "some words"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Flashcard.changeset(%Flashcard{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Flashcard.changeset(%Flashcard{}, @invalid_attrs)
    refute changeset.valid?
  end
end
