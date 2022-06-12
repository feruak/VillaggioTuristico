//function hideModal() {
//    document.getElementById("modal-header").innerText = "";
//    $(".modal-body").empty();
//    $(".modal-footer").empty();
//    document.getElementById("modal").style.display = "none";
//}

// Inserimento prenotazione
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

// Create user
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

// Stampa prenotazioni per AdminPage
function ajaxCallGetAllPrenotations(url) {
    $.ajax({
        method: "GET",
        url: url,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, status) {
            console.log(data);
            const resultDivAdminPage = document.querySelector('#resultDivAdminPage');
            resultDivAdminPage.innerHTML = `
                <div class="table-responsive">
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th>ID Prenotazione</th>
                                <th>Utente</th>
                                <th>Camera</th>
                                <th>Periodo</th>
                            </tr>
                        </thead>
                        <tbody id="tablePrenotations">

                        </tbody>
                    </table>
                </div>

            `;
            let i = 0;
            data.forEach(element => {
                document.querySelector('#tablePrenotations').innerHTML += `
                    <tr>
                        <td>${element.ID}</td>
                        <td>${element.Utente}</td>
                        <td>${element.Camera}</td>
                        <td>${element.Periodo}</td>
                    </tr>
                `});
            this.always();
        },
        error: function (error, status) {
            console.log(error);
            console.log(status);
            this.always();
        },
        always: function () { }
    });
};

// Stampa prenotazioni per UserPage
function ajaxCallGetUserPrenotations(url) {
    $.ajax({
        method: "GET",
        url: url,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, status) {
            console.log(data);
            const resultDivUserPage = document.querySelector('#resultDivUserPage');
            resultDivUserPage.innerHTML = `
                <div class="table-responsive">
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th>ID Prenotazione</th>
                                <th>Utente</th>
                                <th>Camera</th>
                                <th>Periodo</th>
                            </tr>
                        </thead>
                        <tbody id="tablePrenotations">

                        </tbody>
                    </table>
                </div>

            `;
            let i = 0;
            data.forEach(element => {
                document.querySelector('#tablePrenotations').innerHTML += `
                    <tr>
                        <td>${element.ID}</td>
                        <td>${element.Utente}</td>
                        <td>${element.Camera}</td>
                        <td>${element.Periodo}</td>
                    </tr>
                `});
            this.always();
        },
        error: function (error, status) {
            console.log(error);
            console.log(status);
            this.always();
        },
        always: function () { }
    });
};