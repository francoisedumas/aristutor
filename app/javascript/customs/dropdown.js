
const dropDown = () => {
// getting the dataset passed on the top of the index page
      const studentsDataSet = document.querySelector(".temp_information");
      // turn dataset info into usable data
      const students = JSON.parse(studentsDataSet.dataset.temp);
      // bulding a function to look inside the array for all the students matching user keying
      function getStudents(userSearch, students) { // arguments are user input and students array
        return students.filter(student => { // filtering the array need to return here
          const regex = new RegExp(userSearch, 'gi'); // find where ever it will match with Regex
          return student.first_name.match(regex)}); // matching the regex and course name (includes doesn't work) need to return here too
      }

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
        suggestions.innerHTML= html;
        // inserting the new html in the proper place of our html
      }

      const searchValue = document.getElementById('query'); // getting the user input
      const suggestions = document.querySelector('.suggestions'); // getting the place to place the answer

      searchValue.addEventListener('keyup', display);
}

export {dropDown};
