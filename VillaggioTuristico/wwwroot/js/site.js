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
