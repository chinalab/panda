$ ->
	$('#calendar').fullCalendar
		defaultView:'month'
		header:
			right:'agendaDay agendaWeek month today prev next'
    # Google Calendar URL (XML)
		events:
      url: 'https://www.google.com/calendar/feeds/uh4i823pv8nqgdqp04seortgo8%40group.calendar.google.com/public/basic'
			#url: "https://www.google.com/calendar/ical/sem3oqsf0psekt0m1qnt7qgmco%40group.calendar.google.com/private-fdfb8157766204c82f106e87e41a8679/basic.ics"
    eventClick: (calEvent, jsEvent, view) ->
      #      alert "Event: " + calEvent.title
      #      alert calEvent.start
      #      alert calEvent.end
      #      alert "Coordinates: " + jsEvent.pageX + "," + jsEvent.pageY
      #      alert "View: " + view.name
      date = new Date(calEvent.start)
      year = date.getFullYear()
      month = date.getMonth()
      day = date.getDay()
      $.post '/reservations',
        date: 
          year: year
          month: month
          day: day
      return false
    eventMouseover: (calEvent, jsEvent, view) ->     
      $(this).css "border-color", "red"
    eventMouseout: (calEvent, jsEvent, view) ->
      $(this).css "border-color", "black"
