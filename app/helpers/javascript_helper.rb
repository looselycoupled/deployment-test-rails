module JavascriptHelper

  def requirejs_include_tag(file_path = "main")

    file_path = "/assets/#{file_path}"

    if Rails.env.development?
      # Bust the Require.js cache on every page load
      @bust_code ||= %{"bust=" + (new Date()).getTime()}
    else
      # Bust the Require.js cache each time you do a code push that
      # changed an FE asset (fancy!)
      @bust_code ||= %{"bust=#{Rails.configuration.assets.version}"}
    end

    html = %{
      <script>
        var require = {
          urlArgs: #{@bust_code}
        };
      </script>
    }

    html << javascript_include_tag(:require, "data-main" => file_path)
    html.squish.html_safe

  end

end

