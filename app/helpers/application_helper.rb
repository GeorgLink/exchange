module ApplicationHelper

  def nav_link(label, path, opts = {})

    delopt = opts[:method] == "delete"

    delstr = delopt ? "rel='nofollow' data-method='delete'" : ""

    ext1, ext2 = if current_page?(path) then
      ["active", '<span class="sr-only">(current)</span>']
    else
      ["", ""]
    end

    raw %{
      <li class="nav-item #{ext1}">
        <a class="nav-link" #{delstr} href="#{path}">#{label} #{ext2}</a>
      </li>
    }
  end

end
