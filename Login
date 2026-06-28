<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instagram • Login Clone</title>
    <style>
        /* --- CSS STYLING --- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: #fafafa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .wrapper {
            width: 100%;
            max-width: 350px;
            padding: 10px;
        }

        .login-box, .signup-box {
            background-color: #ffffff;
            border: 1px solid #dbdbdb;
            border-radius: 1px;
            padding: 40px 30px;
            text-align: center;
            margin-bottom: 10px;
        }

        .signup-box {
            padding: 20px;
            font-size: 14px;
        }

        .signup-box a {
            color: #0095f6;
            text-decoration: none;
            font-weight: 600;
        }

        .logo {
            font-family: 'Brush Script MT', cursive, sans-serif;
            font-size: 45px;
            font-weight: 500;
            margin-bottom: 30px;
        }

        .login-form {
            display: flex;
            flex-direction: column;
        }

        .input-box {
            position: relative;
            margin-bottom: 6px;
            height: 38px;
            width: 100%;
        }

        .input-box input {
            width: 100%;
            height: 100%;
            background: #fafafa;
            border: 1px solid #dbdbdb;
            border-radius: 3px;
            padding: 9px 8px 7px;
            font-size: 12px;
            outline: none;
        }

        .input-box label {
            position: absolute;
            left: 8px;
            top: 50%;
            transform: translateY(-50%);
            color: #8e8e8e;
            font-size: 12px;
            transition: transform 0.1s ease, font-size 0.1s ease;
            pointer-events: none;
        }

        /* Floating Label Logic */
        .input-box input:focus ~ label,
        .input-box input:valid ~ label {
            transform: translateY(-85%);
            font-size: 10px;
        }

        .input-box input:focus {
            border-color: #a8a8a8;
        }

        .password-container input {
            padding-right: 50px;
        }

        .toggle-btn {
            position: absolute;
            right: 8px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            display: none;
            color: #262626;
        }

        .submit-btn {
            background-color: rgba(0, 149, 246, 0.3);
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-weight: 600;
            font-size: 14px;
            padding: 5px 0;
            margin-top: 8px;
            cursor: pointer;
            height: 30px;
        }

        .submit-btn:enabled {
            background-color: #0095f6;
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 20px 0;
        }

        .line {
            flex: 1;
            height: 1px;
            background-color: #dbdbdb;
        }

        .or-text {
            font-size: 13px;
            font-weight: 600;
            color: #8e8e8e;
            margin: 0 18px;
        }

        .fb-login {
            color: #385185;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            margin-bottom: 12px;
        }

        .forgot-password {
            color: #00376b;
            font-size: 12px;
            text-decoration: none;
        }
    </style>
</head>
<body>

    <div class="wrapper">
        <!-- Main Login Card -->
        <main class="login-box">
            <h1 class="logo">Instagram</h1>
            
            <form class="login-form" id="loginForm">
                <div class="input-box">
                    <input type="text" id="username" required autocomplete="off">
                    <label for="username">Phone number, username, or email</label>
                </div>
                
                <div class="input-box password-container">
                    <input type="password" id="password" required>
                    <label for="password">Password</label>
                    <button type="button" id="togglePassword" class="toggle-btn">Show</button>
                </div>
                
                <button type="submit" class="submit-btn" id="loginBtn" disabled>Log in</button>
                
                <div class="divider">
                    <div class="line"></div>
                    <div class="or-text">OR</div>
                    <div class="line"></div>
                </div>
                
                <a href="#" class="fb-login">Log in with Facebook</a>
                <a href="#" class="forgot-password">Forgot password?</a>
            </form>
        </main>

        <!-- Bottom Sign Up Link -->
        <div class="signup-box">
            <p>Don't have an account? <a href="#">Sign up</a></p>
        </div>
    </div>

    <!-- --- JAVASCRIPT LOGIC --- -->
    <script>
        const usernameInput = document.getElementById('username');
        const passwordInput = document.getElementById('password');
        const loginBtn = document.getElementById('loginBtn');
        const togglePasswordBtn = document.getElementById('togglePassword');
        const loginForm = document.getElementById('loginForm');

        // Activates the button only when fields contain data
        function validateInputs() {
            if (usernameInput.value.trim().length >= 1 && passwordInput.value.length >= 6) {
                loginBtn.disabled = false;
            } else {
                loginBtn.disabled = true;
            }
        }

        // Toggles the visibility of the "Show" text button
        passwordInput.addEventListener('input', () => {
            if (passwordInput.value.length > 0) {
                togglePasswordBtn.style.display = 'block';
            } else {
                togglePasswordBtn.style.display = 'none';
            }
            validateInputs();
        });

        usernameInput.addEventListener('input', validateInputs);

        // Switches between text masking (dots) and visible characters
        togglePasswordBtn.addEventListener('click', () => {
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                togglePasswordBtn.textContent = 'Hide';
            } else {
                passwordInput.type = 'password';
                togglePasswordBtn.textContent = 'Show';
            }
        });

        // Prevents page reload on button click
        loginForm.addEventListener('submit', (e) => {
            e.preventDefault();
            alert(`Clone submitted!\nUsername Entered: ${usernameInput.value}`);
        });
    </script>
</body>
</html>
