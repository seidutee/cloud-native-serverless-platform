const GET_API = window.APP_CONFIG.GET_API;
const POST_API = window.APP_CONFIG.POST_API;

async function loadStudents() {

    try {

        const response = await fetch(GET_API);

        const students = await response.json();

        const table = document.getElementById("studentTableBody");

        table.innerHTML = "";

        students.forEach(student => {

            table.innerHTML += `
                <tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                </tr>
            `;

        });

    }

    catch(error){

        console.error(error);

    }

}

async function saveStudent(){

    const id=document.getElementById("studentId").value.trim();

    const name=document.getElementById("studentName").value.trim();

    if(!id || !name){

        alert("Please complete all fields.");

        return;

    }

    try{

        const response=await fetch(POST_API,{

            method:"POST",

            headers:{

                "Content-Type":"application/json"

            },

            body:JSON.stringify({

                id:id,

                name:name

            })

        });

        if(!response.ok){

            throw new Error("Unable to save student.");

        }

        document.getElementById("studentId").value="";

        document.getElementById("studentName").value="";

        await loadStudents();

    }

    catch(error){

        console.error(error);

        alert(error.message);

    }

}

window.onload=loadStudents;