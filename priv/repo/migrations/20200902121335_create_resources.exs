defmodule ElixirAsyncApi.Repo.Migrations.CreateResources do
  use Ecto.Migration

  def change do
    create table(:resources, primary_key: false) do
      add :id, :string, primary_key: true
      add :name, :string
    end
  end
end
