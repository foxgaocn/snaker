class @Catalogue
  constructor: ->
    $('#submit').click @submit

  submit: (event) ->
    event.preventDefault()
    $.ajax(
      type: 'POST'
      url: '/catalogues'
      data: $('#new_catalogue').serialize()
      ).success( (data, textStatus, jqXHR) =>
        id = data['id']
        $('#myModal').modal()
        callback = (id) ->
          $.ajax( "/catalogues/#{id}/processed").success( ->
            window.location.href = "/catalogues/#{id}"
          )
        setTimeout(callback, 2000, id)
      ).fail((jqXHR, textStatus, errorThrown) ->
        alert('抱歉，出错了')
      )

  checkDone: (id)->
    
