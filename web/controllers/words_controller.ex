defmodule Cardserver.WordsController do
  require Logger
  use Cardserver.Web, :controller
  alias Cardserver.Flashcard

  #  def index(conn, _params) do
  #    Logger.warn "Logging this text!!!" 
  #    create(conn, %{"words" => _params})
  #  end

  def create(conn, %{"words" => words_params}) do                                                                                                                     
      case Flashcard.create(words_params) do
        {:ok, words} ->
          conn
          |> put_status(:created)
          |> render("words.json", words: words)
        {:error, changeset} ->
          conn
          |> put_status(:bad_request)
          |> json(%{error: "error adding new word, #{inspect(changeset)}"})
    end
  end 
end
