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
  // Building an array to temporarly stored students name
  const studentsArray = [];

  function display() {
    const findings = getStudents(this.value, students);
    studentsArray.splice(0, studentsArray.length);
    const html = findings.map((student, i) => {
      const regex = new RegExp(this.value, 'gi'); // find matching with what user is keying in order to highlight it
      const studentName = student.first_name.replace(regex, `<span data-index=${i} class="hl">${this.value}</span>`) // replace what user is keying by a highlight see first span
      studentsArray.push(student.first_name);
      return `
      <li>
        <span class="name">${studentName}</span>
      </li>
      `;
    }).join(''); // carefull map return an array we want a string
    suggestions.innerHTML= '';
    suggestions.innerHTML= html;
    // inserting the new html in the proper place of our html
    console.log(studentsArray);
  }

  if(searchValue.value === ""){
    suggestions.innerHTML= '';
  }
  if (searchValue) {
    searchValue.addEventListener('keyup', display);
  }

  function getName(e) {
    const el = e.target.querySelector('.hl');
    const index = el.dataset.index;
    console.log(studentsArray[index]);
  }

  suggestions.addEventListener('click',getName);

}

export {dropDown};
