
const highlighter = () => {

  const wrongAnswer = document.querySelector('.summary-box-wrong');
  const goodAnswer = document.querySelector('.summary-box-correct');

  if (wrongAnswer) {
    console.log(wrongAnswer.textContent);
    let text = '';
    wrongAnswer.textContent.split('').forEach(function(val, i){
    if (val != goodAnswer.textContent.charAt(i))
      text += "<span class='highlight'>"+val+"</span>";
    else
      text += val;
  });
  wrongAnswer.innerHTML= text;

  }
}


export {highlighter};
