let data = {
  playerName: "",
  playerScore: 0,
};
let correctSound = new Audio("../Audio/correct.mp3");
let wrongSound = new Audio("../Audio/wrong.mp3");
let congrats = new Audio("../Audio/congrats.mp3");
let currentQuestion = 0;


function setChoicesLabel(letter, response_letter) {
  $("label[for='" + letter + "']").text(response_letter);
};


function setCorrectAnswer(letter) {
  let choices = ["a", "b", "c", "d"];
  choices.forEach(element => {
    if (letter === element) {
      $("#" + element).val("true");
    } else {
      $("#" + element).val("false");
    }
  });
}


function getNextQuestion() {
  currentQuestion++;
  let data = { id: currentQuestion };
  $.ajax({
    url: "../Server/post_questions.php",
    method: 'POST',
    data: data,
    dataType: 'json',
    success: function (response) {
      // Display the result from the PHP script
      $("#question").text(response.question);
      setChoicesLabel("a", response.a);
      setChoicesLabel("b", response.b);
      setChoicesLabel("c", response.c);
      setChoicesLabel("d", response.d);

      switch (response.correctAnswer) {
        case "1":
          setCorrectAnswer("a");
          break;
        case "2":
          setCorrectAnswer("b");
          break;
        case "3":
          setCorrectAnswer("c");
          break;
        case "4":
          setCorrectAnswer("d");
          break;
      }
    },
    error: function () {
      alert('Error occurred during AJAX request.');
    }
  });
}


function flash(color) {
  $("body").css("background-image", "none");
  $("body").css("background-color", color);
  setTimeout(function () {
    $("body").css("background-color", "");
    $("body").css("background-image", 'url("../Icons/background.png")');
  }, 300);
}


function correct() {
  data.playerScore++;
  $("#score").html(data.playerScore);
  wrongSound.pause();
  correctSound.pause();
  correctSound.currentTime = 0;
  correctSound.play();
  flash("green");
}


function wrong() {
  wrongSound.pause();
  wrongSound.currentTime = 0;
  correctSound.pause();
  wrongSound.play();
  flash("red");
}



function checkOption() {
  let selectedOption = $('input[name="qChoices"]:checked').val();
  if (selectedOption) {
    if (selectedOption == "true") {
      correct();
    } else {
      wrong()
    }
  } else {
    alert("Choose your answer");
  }
}

$(document).ready(function () {
  currentQuestion = 0;
  $("#q").removeClass("d-none");
  $("#finish").addClass("d-none");
  congrats.currentTime = 0;
  correctSound.currentTime = 0;
  wrongSound.currenTime = 0;

  $("#playQuiz").click(function () {
    if ($("#name").val() != "") {
      data.playerName = $("#name").val();
      $("#getName").addClass("d-none");
      $("#quizContent").removeClass("d-none");
      getNextQuestion();

    } else {
      alert("Enter your name");
    }
  });

  $("#qButton").click(() => {
    if (currentQuestion >= 10) {
      $("#qButton").text("Submit");
      congrats.play();
      $("#q").addClass("d-none");
      $("#finish").removeClass("d-none");
      checkOption();
    } else {
      getNextQuestion();
      checkOption();
    }
  })

  $("#homeButton").click(function () {
    $.post("../Server/post_score.php", data, function (response) {
      console.log(response);
    });
    window.location.href = "../Pages/index.html";
  });
});
