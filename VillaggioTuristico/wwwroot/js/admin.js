﻿function prenotazioniAdmin() {
    $.ajax({
        method: "GET",
        url: "/api/Prenotation/ListaPrenotazioniAdmin",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, status) {
            for (var i = 0; i < data.length; i++) {
                $("#listaPrenotazioni").append("<br/><div>" + "Utente:" + data[i].utente + "Camera:" + data[i].tipologia +/* "Periodo:" + data[i].periodo +*/ "</div>");
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
