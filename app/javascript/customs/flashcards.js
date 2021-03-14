const flipDisplay = () => {

  const studentAnswer = document.getElementById('student-answer');

  const flip = document.getElementById('flip');
  flip.addEventListener('click', (event) => {
    // get the answer
    const studentAnswerValue = studentAnswer.value;
    // display the answer in the hidden answer section
    const studentAnswerDisplay = document.getElementById('student-answer-display');
    studentAnswerDisplay.innerText = `Votre reponse: ${studentAnswerValue}`;
    // hide the question section
    document.getElementById('question').style.display = 'none';
    // show the answer section
    document.getElementById('answer').style.display = 'block';
  })
}


export {flipDisplay};
