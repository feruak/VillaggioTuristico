﻿function ajaxCall(url, data) {
    OKButton = document.getElementById("modalOKButton");
    OKButton.disabled = true;
    $.ajax({
        type: "POST",
        url: url,
        //contentType: "application/json; charset=utf-8",
        data: data,
        dataType: "json",
        success: function (response, status) {
            textP = document.createElement("p");
            textP.style.textAlign = "center";
            textP.innerText = response;
            document.getElementById("modal-body").appendChild(textP);
            this.always();
        },
        error: function (error, status) { this.always(); },
        always: function () {
            OKButton = document.getElementById("modalOKButton");
            OKButton.disabled = false;
            OKbutton.onclick = function () {
                location = location;
                //hideModal();
            }
            CancelButton = document.getElementById("modalCancelButton");
            CancelButton.disabled = true;
        }
    });
}

function showInformationModal(text) {
    textP = document.createElement("p");
    textP.style.textAlign = "center";
    textP.innerText = text;
    document.getElementById("modal-body").appendChild(textP);
    $(".modal-footer").empty();
    OKbutton = document.createElement("button");
    OKbutton.innerText = "OK";
    OKbutton.id = "modalOKButton";
    OKbutton.classList.add("btn");
    OKbutton.classList.add("btn-primary");
    OKbutton.onclick = function () {
        location = location;
        //hideModal();
    }
    $(".modal-footer").append(OKbutton);
    document.getElementById("modal").style.display = "block";
}

//<users>
function showConfirmationModalForUsers(url, data) {
    document.getElementById("modal-header").innerText = data.addOrDelete + " user ?";
    questionP = document.createElement("p");
    questionP.style.textAlign = "center";
    questionP.innerText = data.addOrDelete + " user ?";
    document.getElementById("modal-body").appendChild(questionP);

    OKbutton = document.createElement("button");
    OKbutton.innerText = "OK";
    OKbutton.id = "modalOKButton";
    OKbutton.classList.add("btn");
    OKbutton.classList.add("btn-primary");

    if (data.addOrDelete == 'Add' || data.addOrDelete == 'Edit') {
        userNameP = document.createElement("p");
        userNameP.style.textAlign = "center";
        userNameP.innerText = 'Username';
        document.getElementById("modal-body").appendChild(userNameP);
        userNameTextArea = document.createElement("input");
        userNameP.appendChild(userNameTextArea);

        emailP = document.createElement("p");
        emailP.style.textAlign = "center";
        emailP.innerText = 'Email';
        document.getElementById("modal-body").appendChild(emailP);
        emailTextArea = document.createElement("input");
        emailP.appendChild(emailTextArea);

        passwordP = document.createElement("p");
        passwordP.style.textAlign = "center";
        passwordP.innerText = 'Password';
        document.getElementById("modal-body").appendChild(passwordP);
        passwordTextArea = document.createElement("input");
        passwordTextArea.setAttribute("type", "password");
        passwordP.appendChild(passwordTextArea);

        confirmPasswordP = document.createElement("p");
        confirmPasswordP.style.textAlign = "center";
        confirmPasswordP.innerText = 'Confirm Password';
        document.getElementById("modal-body").appendChild(confirmPasswordP);
        confirmPasswordTextArea = document.createElement("input");
        confirmPasswordTextArea.setAttribute("type", "password");
        confirmPasswordP.appendChild(confirmPasswordTextArea);

        OKbutton.onclick = function () {
            data.username = userNameTextArea.value;
            data.email = emailTextArea.value;
            data.password = passwordTextArea.value;
            data.confirmpassword = confirmPasswordTextArea.value;
            userNameTextArea.disabled = true;
            emailTextArea.disabled = true;
            passwordTextArea.disabled = true;
            confirmPasswordTextArea.disabled = true;
            ajaxCall(url, data);
        }
    }
    else {
        OKbutton.onclick = function () {
            ajaxCall(url, data);
        }
    }
    $(".modal-footer").append(OKbutton);
    CancelButton = document.createElement("button");
    CancelButton.innerText = "Cancel";
    CancelButton.id = "modalCancelButton";
    CancelButton.classList.add("btn");
    CancelButton.classList.add("btn-danger");
    CancelButton.onclick = function () {
        hideModal();
    }
    $(".modal-footer").append(CancelButton);
    document.getElementById("modal").style.display = "block";
}
//</users>