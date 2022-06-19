function ajaxCallCreateUser(url) {
    var data = {};
    data.userName = document.querySelector("#InputUserName").value;
    data.email = document.querySelector("#InputEmail").value;
    data.password = document.querySelector("#InputPassword").value;
    data.confirmPassword = document.querySelector("#InputConfirmPassword").value;
    $.ajax({
        method: "POST",
        url: url,
        // contentType: "application/json; charset=utf-8",
        data: data,
        dataType: "json",
        success: function (response, status) {
            textP = document.createElement("p");
            textP.style.textAlign = "center";
            textP.innerText = response;
            document.getElementById("CreateUserModalBody").appendChild(textP);
            this.always();
        },
        error: function (error, status) {
            console.log(data);
            console.log(error);
            console.log(status);
            this.always();
        },
        always: function () { }
    });
};

// Inserimento prenotazione
function insertPrenotation() {
    var body = {};

    body.Tipologia = $('#tipologia').val();
    $.ajax({
        method: "POST",
        url: "/api/Prenotation/InsertPrenotation",
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

//// Popola la select con i periodi
//function elencoPeriodi() {
//    $.ajax({
//        method: "GET",
//        url: "/api/Periodi",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (data, status) {
//            for (var i = 0; i < data.length; i++) {
//                //console.log(data[i])
//                $("#periodi").append("<option value=" + data[i].periodo + ">" + data[i].periodo + "</option>")
//            }
//        },
//        error: function (error, status) {
//            console.log(error);
//            console.log(status);
//            this.always();
//        },
//        always: function () { }
//    });
//}

// Ottiene l'elenco delle camere e popola la select con le tipologie di came disponibili
function elencoCamere() {
    $.ajax({
        method: "GET",
        url: "/api/Camere",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, status) {
            for (var i = 0; i < data.length; i++) {
                console.log(data[i])
                $("#tipologia").append("<option value=" + data[i].tipologia + ">" + data[i].tipologia + "</option>")
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

// Al caricamento della pagina, chiama la funzione elencoCamere();
$(document).ready(function () {
    /*elencoPeriodi();*/
    elencoCamere();
});

// Stampa prenotazioni Admin, gestita l'eventualità di più click sul bottone
$('#prenotazioniAdmin').one('click', function() {
    $.ajax({
        method: "GET",
        url: "/api/Prenotation/ListaPrenotazioniAdmin",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, status) {
            data.forEach(element => {
                document.querySelector('#listaPrenotazioni').innerHTML += `
                    <tr>
                        <td>${element.id}</td>
                        <td>${element.utente}</td>
                        <td>${element.tipologia}</td>
                    </tr>
                `
            });

            //for (var i = 0; i < data.length; i++) {
            //    $("#listaPrenotazioni").append("<br/><div>" + "Utente:" + data[i].utente + "Camera:" + data[i].tipologia +/* "Periodo:" + data[i].periodo +*/ "</div>");
            //}
        },
        error: function (error, status) {
            console.log(error);
            console.log(status);
            this.always();
        },
        always: function () { }
    });
});

// Stampa prenotazioni user, gestita l'eventualità di più click sul bottone
$('#prenotazioniUser').one('click', function () {
    $.ajax({
        method: "GET",
        url: "/api/Prenotation/ListaPrenotazioni",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, status) {
            data.forEach(element => {
                document.querySelector('#resultDivUserPage').innerHTML += `
                    <tr>
                        <td>${element.id}</td>
                        <td>${element.tipologia}</td>
                    </tr>
                `
            });

            //for (var i = 0; i < data.length; i++) {
            //  $("#resultDivUserPage").append("<br/><div>" + "Camera:" + data[i].tipologia /*+ "Periodo:" + data[i].periodo*/ + "</div>");}

        },
        error: function (error, status) {
            console.log(error);
            console.log(status);
            this.always();
        },
        always: function () { }
    });
});

