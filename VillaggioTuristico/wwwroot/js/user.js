function prenotazioniUser() {
    $.ajax({
        method: "GET",
        url: "/api/Prenotation/ListaPrenotazioni",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, status) {
            for (var i = 0; i < data.length; i++) {
                $("#resultDivUserPage").append("<br/><div>" + "Camera:" + data[i].tipologia /*+ "Periodo:" + data[i].periodo*/ + "</div>");
            }
        },
        error: function (error, status) {
            console.log(error);
            console.log(status);
            this.always();
        },
        always: function () { }
    });
};