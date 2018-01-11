defmodule Cardserver.WordsView do
  use Cardserver.Web, :view

  def render("words.json", %{words: words}) do
    %{
      word: words.words,
      definition: words.definition
    }
  end
end 
