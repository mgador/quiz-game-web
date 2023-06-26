$(document).ready(() => {
    $('#createAdmin').click((e) => {
        e.preventDefault();
        let adminData = {
            name: $('#name').val(),
            email: $('#email').val(),
            username: $('#username').val(),
            password: $('#password').val()
        };

        $.post('../Server/signup.php', adminData, function (response) {
            alert(response);
            window.location.href = '../Pages/login.html';
        })
    })
});