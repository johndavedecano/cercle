defmodule CercleApi.Opportunity do
  use CercleApi.Web, :model
	
  schema "opportunities" do

    field :name, :string
    field :stage, :integer, default: 0
    field :status, :integer  , default: 0 #### 0 OPEN, 1 CLOSED WIN, 2 CLOSED LOST
    belongs_to :main_contact, CercleApi.Contact
    field :contact_ids, {:array, :integer}
    belongs_to :user, CercleApi.User
    belongs_to :company, CercleApi.Company

    timestamps
  end

  @required_fields ~w(main_contact_id user_id company_id)
  @optional_fields ~w(name stage status contact_ids)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
	
end
