$(document).ready(() => {
    $('#loginBtn').click((e) => {
        e.preventDefault();
        let userData = {
            username: $('#username').val(),
            password: $('#password').val()
        }
        $.post('../Server/authentication.php', userData, (response) => {
            if (response === 'success') {
                window.location.href = '../Pages/admin.html';
            } else {
                alert('Invalid username or password');
            }
        })

    })
})