const API_URL = window.APP_CONFIG?.API_URL;

if (!API_URL) {

    console.error("API_URL was not loaded from config.js");

    document.getElementById("message").innerHTML =
        "Application configuration could not be loaded.";

}

async function saveStudent() {

    if (!API_URL) {
        return;
    }

    const id = document.getElementById("studentId").value.trim();
    const name = document.getElementById("studentName").value.trim();

    if (!id || !name) {

        document.getElementById("message").innerHTML =
            "Please enter both Student ID and Student Name.";

        return;
    }

    try {

        const response = await fetch(`${API_URL}/students`, {

            method: "POST",

            headers: {
                "Content-Type": "application/json"
            },

            body: JSON.stringify({
                id,
                name
            })
        });

        const data = await response.json();

        if (!response.ok) {
            throw new Error(data.message || "Request failed");
        }

        document.getElementById("message").innerHTML =
            "Student saved successfully.";

        console.log(data);

    }
    catch (error) {

        console.error(error);

        document.getElementById("message").innerHTML =
            error.message;
    }

}