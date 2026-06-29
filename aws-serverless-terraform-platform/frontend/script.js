const API_URL = window.APP_CONFIG.API_URL;

async function saveStudent() {

    const id = document.getElementById("studentId").value;
    const name = document.getElementById("studentName").value;

    const response = await fetch(
        `${API_URL}/students`,
        {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                id,
                name
            })
        }
    );

    const data = await response.json();

    document.getElementById("message").innerHTML =
        JSON.stringify(data);
}
