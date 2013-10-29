$(document).ready(function() {

  $('#calendar').fullCalendar({
      header: {
          left: 'prev,next today',
          center: 'title',
          right: false
      },
      eventClick: function(calEvent, jsEvent, view) {
          if (calEvent.type === 'bank-holiday') return false;
          window.location = "/vacations/" + calEvent.id
      },
      theme: true,
      events: "/calendar",
      disableDragging: true,
      weekends: false
  });

  $('.fc-button-next, .fc-button-prev, .fc-button-today').bind('click', monthNavigation);

  function monthNavigation(e) {
    var currentDate = $('#calendar').fullCalendar('getDate')
      , currentMonth = currentDate.getMonth()
      , currentYear = currentDate.getFullYear()
      , urlString = '/calendar/show?year=' + currentYear + '&month=' + currentMonth

    e.preventDefault();
    history.pushState('', '', urlString);
    $('#calendar').fullCalendar('gotoDate', currentYear, currentMonth);
  }

  // var monthParam = getParameterByName('month')
  //   , yearParam = getParameterByName('year')
  //   , monthAndYearParam = monthParam && yearParam;

  // if (monthAndYearParam) {
  //   $('#calendar').fullCalendar('gotoDate', yearParam, monthParam);
  // }

});