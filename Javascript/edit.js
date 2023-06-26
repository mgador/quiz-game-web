
$(document).ready(() => {
    $.get('../Server/get_questions.php', (response) => {
        $('#questionsForm').append(response);

    })


    $('#saveBtn').click((e) => {
        e.preventDefault();

        let questionsData = {};
        for (let i = 1; i <= 10; i++) {
            questionsData[`q${i}`] = $(`#q${i}`).val();
            questionsData[`q${i}a`] = $(`#q${i}aAnswer`).val();
            questionsData[`q${i}b`] = $(`#q${i}bAnswer`).val();
            questionsData[`q${i}c`] = $(`#q${i}cAnswer`).val();
            questionsData[`q${i}d`] = $(`#q${i}dAnswer`).val();
            questionsData[`q${i}Correct`] = $(`input[name="q${i}Choices"]:checked`).val();
        }
        $.post('../Server/save_questions.php', questionsData, (response) => {
            alert(response);
            window.location.href = "../Pages/admin.html";
        })

    })
})