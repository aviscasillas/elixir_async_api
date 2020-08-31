defmodule ElixirAsyncApiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  object :resource do
    field :id, :id
    field :name, :string
  end

  object :mutation_response do
    field :status, :string
  end
end
