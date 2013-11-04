require 'nokogiri'
require 'open-uri'


page  = Nokogiri::HTML(open("http://byucougars.com/schedule/m-basketball/2012-2013"))
stats = page.css('tr.past')



File.open('stats.html', 'w') do |f|

f.puts("<html>")
  f.puts("<head>")
  f.puts("  <title>BYU Basketball Stats</title>")
  f.puts("  <link rel='stylesheet' href='style.css' type='text/css' media='screen'/>")
  f.puts("</head>")
  f.puts("<body>")
  f.puts("  <h1>BYU Basketball Stats</h1>")
  f.puts("  <table>")
  f.puts("  <tr><th>Opponent</th><th>Score</th></tr>")


  stats.each do |stat|
   opponent = stat.at_css("td.opp a.highlight")
   score = stat.at_css("a.result")
    if opponent
      f.puts("<tr><td>#{opponent.text}</td><td>#{score.text}</td></tr>")
    end
  end

  f.puts("  </table>")
  f.puts("</body>\n")
  f.puts("</html>\n")
end


# <table>
#   <th></th>
#   <tr>
#     <td></td>
#   </tr>
# </table>