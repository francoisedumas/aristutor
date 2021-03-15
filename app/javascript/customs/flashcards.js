

const flipDisplay = () => {

  const studentAnswer = document.getElementById('student-answer');
  // get the question section
  const recto = document.getElementById('flashcard-wrapper');
  const question = document.getElementById('question');

  // get the answer section
  const verso = document.getElementById('answer');

  const flip = document.getElementById('flip');
  if (flip) {
    flip.addEventListener('click', (event) => {
      recto.classList.toggle('animate');
      window.setTimeout(function(){
        question.style.display = 'none';
        verso.style.display = 'block';
      },400);
      // get the answer
      const studentAnswerValue = studentAnswer.value;
      // display the answer in the hidden answer section
      const studentAnswerDisplay = document.getElementById('student-answer-display');
      studentAnswerDisplay.innerText = `Votre reponse: ${studentAnswerValue}`;

    })
  }
}


export {flipDisplay};
