$(document).on('turbolinks:load', function () {
  $('.dropdown-button').dropdown({
    hover: false
  })
  $('.modal').modal()

  $('select').material_select()

  window.setInterval(function(){
    $('.carousel').carousel('next')
  }, 5000)

  $('.carousel.carousel-slider').carousel({
    fullWidth: true,
    indicators: true,
    height: 600
  })

  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year,
    formatSubmit: 'yyyy-mm-dd',
    hiddenName: true,
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: true // Close upon selecting a date,
  })

  $('.timepicker').pickatime({
    default: 'now', // Set default time: 'now', '1:30AM', '16:30'
    fromnow: 0, // set default time to * milliseconds from now (using with default = 'now')
    twelvehour: true, // Use AM/PM or 24-hour format
    donetext: 'OK', // text for done-button
    cleartext: 'Clear', // text for clear-button
    canceltext: 'Cancel', // Text for cancel-button
    autoclose: true, // automatic close timepicker
    ampmclickable: true, // make AM PM clickable
    aftershow: function () {} // Function for after opening timepicker
  })

  $('.dropdown-button').dropdown({
    inDuration: 300,
    outDuration: 225,
    constrainWidth: false, // Does not change width of dropdown to that of the activator
    hover: false, // Activate on hover
    gutter: 0, // Spacing from edge
    belowOrigin: true, // Displays dropdown below the button
    alignment: 'left', // Displays dropdown with edge aligned to the left of button
    stopPropagation: false // Stops event propagation
  }
  )

  $('input.autocomplete').autocomplete({
    data: {
      'Admiralty': null,
      'Aljunied': null,
      'Ang Mo Kio': null,
      'Bartley': null,
      'Bayfront': null,
      'Beauty World': null,
      'Bedok': null,
      'Bedok North': null,
      'Bedok Reservoir': null,
      'Bencoolen': null,
      'Bendemeer': null,
      'Bishan': null,
      'Boon Keng': null,
      'Boon Lay': null,
      'Botanic Gardens': null,
      'Braddell': null,
      'Bras Basah': null,
      'Buangkok': null,
      'Bugis': null,
      'Bukit Batok': null,
      'Bukit Brown': null,
      'Bukit Gombak': null,
      'Bukit Panjang': null,
      'Buona Vista': null,
      'Caldecott': null,
      'Canberra': null,
      'Cashew': null,
      'Changi Airport': null,
      'Chinatown': null,
      'Chinese Garden': null,
      'Choa Chu Kang': null,
      'City Hall': null,
      'Clarke Quay': null,
      'Clementi': null,
      'Commonwealth': null,
      'Dakota': null,
      'Dhoby Ghaut': null,
      'Dover': null,
      'Downtown': null,
      'Esplanade': null,
      'Eunos': null,
      'Expo': null,
      'Farrer Park': null,
      'Farrer Road': null,
      'Fort Canning': null,
      'Geylang Bahru': null,
      'Gul Circle': null,
      'HarbourFront': null,
      'Haw Par Villa': null,
      'Hillview': null,
      'Holland Village': null,
      'Hougang': null,
      'Jalan Besar': null,
      'Joo Koon': null,
      'Jurong East': null,
      'Kaki Bukit': null,
      'Kallang': null,
      'Kembangan': null,
      'Kent Ridge': null,
      'Khatib': null,
      'King Albert Park': null,
      'Kovan': null,
      'Kranji': null,
      'Labrador Park': null,
      'Lakeside': null,
      'Lavender': null,
      'Little India': null,
      'Lorong Chuan': null,
      'MacPherson': null,
      'Marina Bay': null,
      'Marina South Pier': null,
      'Marsiling': null,
      'Marymount': null,
      'Mattar': null,
      'Mountbatten': null,
      'Newton': null,
      'Nicoll Highway': null,
      'Novena': null,
      'one-north': null,
      'Orchard': null,
      'Outram Park': null,
      'Pasir Panjang': null,
      'Pasir Ris': null,
      'Paya Lebar': null,
      'Pioneer': null,
      'Potong Pasir': null,
      'Promenade': null,
      'Punggol': null,
      'Queenstown': null,
      'Raffles Place': null,
      'Redhill': null,
      'Rochor': null,
      'Sembawang': null,
      'Sengkang': null,
      'Serangoon': null,
      'Simei': null,
      'Sixth Avenue': null,
      'Somerset': null,
      'Stadium': null,
      'Stevens': null,
      'Tai Seng': null,
      'Tampines': null,
      'Tampines East': null,
      'Tampines West': null,
      'Tan Kah Kee': null,
      'Tanah Merah': null,
      'Tanjong Pagar': null,
      'Telok Ayer': null,
      'Telok Blangah': null,
      'Tiong Bahru': null,
      'Toa Payoh': null,
      'Tuas Crescent': null,
      'Tuas Link': null,
      'Tuas West Road': null,
      'Ubi': null,
      'Upper Changi': null,
      'Woodlands': null,
      'Woodleigh': null,
      'Yew Tee': null,
      'Yio Chu Kang': null,
      'Yishun': null
    },
    limit: 10, // The max amount of results that can be shown at once. Default: Infinity.
    onAutocomplete: function (val) {
    // Callback function when value is autcompleted.
    },
    minLength: 1 // The minimum length of the input for the autocomplete to start. Default: 1.
  })

  if (document.getElementById('widget_opener')) {
    document.getElementById('widget_opener').addEventListener('click', function () {
      cloudinary.openUploadWidget({ cloud_name: 'ddanielnp', upload_preset: 'c3bf2cga'},
    function (error, result) {
      console.log(error, result)
    })
    }, false)

    $('#widget_opener').cloudinary_upload_widget({
      cloud_name: 'ddanielnp',
      theme: 'minimal',
      upload_preset: 'c3bf2cga',
      cropping: 'server'
    }, function (error, result) {
      // console.log(error, result)
      $('#request_image').val(result[0].url)
      $('#reward_image').val(result[0].url)
    // console.log(error, result)
    })
  }
})
