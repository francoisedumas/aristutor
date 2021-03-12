const flipDisplay = () => {
  const flip = document.getElementById('flip');
  flip.addEventListener('click', (event) => {
    // console.log('test');
    document.getElementById('question').style.display = 'none';
    document.getElementById('answer').style.display = 'block';
  })
}

export {flipDisplay};
