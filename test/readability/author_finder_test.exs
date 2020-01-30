defmodule Readability.AuthoFinderTest do
  use ExUnit.Case, async: true

  alias Readability.AuthorFinder

  test "extracting bbc format author" do
    html = "bbc.html" |> TestHelper.read_fixture() |> Floki.parse_document!()
    assert AuthorFinder.find(html) == ["BBC News"]
  end

  test "extracting buzzfeed format author" do
    html = "buzzfeed.html" |> TestHelper.read_fixture() |> Floki.parse_document!()
    assert AuthorFinder.find(html) == ["Salvador Hernandez", "Hamza Shaban"]
  end

  test "extracting medium format author" do
    html = "medium.html" |> TestHelper.read_fixture() |> Floki.parse_document!()
    assert AuthorFinder.find(html) == ["Ken Mazaika"]
  end

  test "extracting nytimes format author" do
    html = "nytimes.html" |> TestHelper.read_fixture() |> Floki.parse_document!()
    assert AuthorFinder.find(html) == ["Judith H. Dobrzynski"]
  end
end
