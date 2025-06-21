defmodule LivepaneBugWeb.ReproLive do
  use LivepaneBugWeb, :live_view

  def mount(params, session, socket) do
    socket =
      socket
      |> assign(:count, 1)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <LivePane.group id="demo" class="h-[450px]">
      <LivePane.pane
        group_id="demo"
        id="demo_pane_1"
        class="h-full flex items-center justify-center border border-green-500"
      >
        {@count}
      </LivePane.pane>

      <LivePane.resizer
        id="demo-resizer"
        group_id="demo"
        class="flex h-full w-2 items-center justify-center"
      >
        <div class="size-4 rounded-sm border bg-brand"></div>
      </LivePane.resizer>
      <LivePane.pane
        group_id="demo"
        id="demo_pane_2"
        class="h-full flex items-center justify-center border border-red-500"
      >
        <.button phx-click="click">
          Click me
        </.button>
      </LivePane.pane>
    </LivePane.group>
    """
  end

  def handle_event("click", _params, socket) do
    socket =
      socket
      |> assign(:count, socket.assigns[:count] + 1)

    {:noreply, socket}
  end
end
