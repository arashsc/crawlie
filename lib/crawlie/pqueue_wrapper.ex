defmodule Crawlie.PqueueWrapper do

  alias __MODULE__, as: This
  alias Crawlie.Page

  @valid_pqueue_modules [:pqueue, :pqueue2, :pqueue3, :pqueue4]

  @type t :: %This{
    module: atom,
    data: term,
  }
  defstruct [
    :module,
    :data,
  ]


  #===========================================================================
  # API functions
  #===========================================================================

  @spec new(atom) :: This.t
  @doc """
  Constructs a new PqueueWrapper with `module` as the underlying
  impelementation.
  """
  def new(module) when module in @valid_pqueue_modules do
    %This{
      module: module,
      data: module.new(),
    }
  end


  @spec len(This.t) :: integer
  @doc """
  Returns the size of the underlying queue.
  """
  def len(%This{module: module, data: data}) do
    module.len(data)
  end


  @spec empty?(This.t) :: boolean
  @doc """
  Checks if this Pqueue is empty.
  """
  def empty?(%This{module: module, data: data}) do
    module.is_empty(data)
  end


  @spec add_page(This.t, Page.t) :: This.t
  def add_page(%This{module: module, data: data} = this, %Page{depth: depth} = page) do
    p = get_priority(this, depth)
    data = module.in(page, p, data)
    %This{this | data: data}
  end


  @spec take(This.t) :: {This.t, term}
  def take(%This{module: module, data: data} = this) do
    {{_priority, item}, data} = module.out(data)
    {%This{this | data: data}, item}
  end

  #---------------------------------------------------------------------------
  # Public helper functions
  #---------------------------------------------------------------------------

  @doc """
  based on the page depht gets a priority to use with the queue,
  to utilize the particular pqueue's tusage best
  """
  def get_priority(%This{module: :pqueue}, depth), do: -depth + 20
  def get_priority(%This{module: :pqueue2}, depth), do: -depth
  def get_priority(%This{module: :pqueue3}, depth), do: -depth
  def get_priority(%This{module: :pqueue4}, depth), do: -depth + 128

end
