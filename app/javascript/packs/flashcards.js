const flipDisplay = () => {
  flip.addEventListener('click', (event) => {
    document.getElementById('question').style.display = 'none';
    document.getElementById('answer').style.display = 'block';
  }
}

export {flipDisplay};
