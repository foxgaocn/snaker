class @Catalogue
  constructor: (id)->
    $('#myModal').modal()
    callback = (id) ->
      $.ajax( "/catalogues/#{id}/processed").success( ->
        window.location.href = "/catalogues/#{id}"
      )
    setInterval(callback, 2000, id)

    
