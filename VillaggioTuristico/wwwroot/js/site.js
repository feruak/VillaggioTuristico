function hideModal() {
    document.getElementById("modal-header").innerText = "";
    $(".modal-body").empty();
    $(".modal-footer").empty();
    document.getElementById("modal").style.display = "none";
}
function insertPrenotation() {
    var body = {};
    body.Prenotazione = $('#prenotationPrenotazione').val();
    body.Utente = $('#prenotationUtente').val();
    body.Camera = $('#prenotationCamera').val();
    body.Periodo = $('#prenotationPeriodo').val();
    $.ajax({
        method: "POST",
        url: "/api/Prenotation",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(body),
        dataType: "json",
        success: function (data, status) {
            console.log(body);
            console.log(data);
            console.log(status);
            this.always();
        },
        error: function (error, status) {
            console.log(body);
            console.log(error);
            console.log(status);
            this.always();
        },
        always: function () { }
    });
};
function prenotazioniUser() {
    $.ajax({
        method: "GET",
        url: "/api/Prenotation/ListaPrenotazioni",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, status) {
            for (var i = 0; i < data.length; i++) {
                $("#resultDiv").append("<br/><div>" + "Camera:" + data[i].camera + "Periodo:" + data[i].periodo + "</div>");
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
function prenotazioniAdmin() {
    $.ajax({
        method: "GET",
        url: "/api/Prenotation/ListaPrenotazioniAdmin",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, status) {
            for (var i = 0; i < data.length; i++) {
                $("#listaPrenotazioni").append("<br/><div>" + "Utente:" + data[i].utente + "Camera:" + data[i].camera + "Periodo:" + data[i].periodo + "</div>");
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

function elencoPeriodi() {
    $.ajax({
        method: "GET",
        url: "/api/Periodi",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, status) {
            for (var i = 0; i < data.length; i++) {
                console.log(data[i])
                //$("#periodi").append("<option value=" + data[i].periodo + ">" + data[i].periodo + "</option>")
            }
        },
        error: function (error, status) {
            console.log(error);
            console.log(status);
            this.always();
        },
        always: function () { }
    });
}
    function elencoCamere() {
        $.ajax({
            method: "GET",
            url: "/api/Camere",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data, status) {
                for (var i = 0; i < data.length; i++) {
                    console.log(data[i])
                     $("#camere").append("<option value=" + data[i].camera + ">" + data[i].camera + "</option>")
                }
            },
            error: function (error, status) {
                console.log(error);
                console.log(status);
                this.always();
            },
            always: function () { }
        });
    }
    $(document).ready(function() {
    prenotazioniUser();
    elencoPeriodi();
    elencoCamere();
    prenotazioniAdmin()
    });

