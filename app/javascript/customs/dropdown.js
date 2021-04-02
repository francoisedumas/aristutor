// bulding a function to look inside the array for all the students matching user keying
const getStudents = (userSearch, students) => { // arguments are user input and students array
    return students.filter(student => { // filtering the array need to return here
      const regex = new RegExp(userSearch, 'gi'); // find where ever it will match with Regex
      return student.first_name.match(regex)}); // matching the regex and course name (includes doesn't work) need to return here too
  }

const dropDown = () => {
// getting the dataset passed on the top of the index page
  const studentsDataSet = document.querySelector(".temp_information");
  // turn dataset info into usable data
  const students = JSON.parse(studentsDataSet.dataset.temp);
  // getting the user input
  const searchValue = document.getElementById('query');
  // getting the place to place the answer
  const suggestions = document.querySelector('.suggestions');
  // getting all the name displayed
  const keyedValues = document.querySelectorAll('.name');


  function display() {
    // console.log(this.value);
    const findings = getStudents(this.value, students);
    const html = findings.map(student => {
      const regex = new RegExp(this.value, 'gi'); // find matching with what user is keying in order to highlight it
      const studentName = student.first_name.replace(regex, `<span class="hl">${this.value}</span>`) // replace what user is keying by a highlight see first span
      return `
      <li>
        <span class="name">${studentName}</span>
      </li>
      `;
    }).join(''); // carefull map return an array we want a string
    suggestions.innerHTML= '';
    suggestions.innerHTML= html;
    // inserting the new html in the proper place of our html
  }

  if(searchValue.value === ""){
    suggestions.innerHTML= '';
  }
  if (searchValue) {
    searchValue.addEventListener('keyup', display);
  }

  keyedValues.forEach( keyedValue => keyedValue.addEventListener('click',console.log(keyedValue.textContent)));

}

export {dropDown};
