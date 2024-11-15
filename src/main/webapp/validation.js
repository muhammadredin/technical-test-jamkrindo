$(document).ready(function () {
    // Event listener for form submission
    $('#loginForm').on('submit', function (e) {
        // Prevent form submission
        e.preventDefault();

        // Clear any previous error messages
        $('.error').text('');

        // Get form values
        const username = $('#username').val().trim();
        const password = $('#password').val().trim();

        let isValid = true;

        if (username === '') {
            $('#usernameError').text('Username is required.');
            isValid = false;
        } else if (username.length < 3) {
            $('#usernameError').text('Username must be at least 3 characters.');
            isValid = false;
        }

        if (password === '') {
            $('#passwordError').text('Password is required.');
            isValid = false;
        } else if (password.length < 4) {
            $('#passwordError').text('Password must be at least 4 characters.');
            isValid = false;
        }

        if (isValid) {
            alert('Form submitted successfully!');
            // Uncomment the line below to allow form submission to the server
            this.submit();
        }
    });

    // Real-time validation for username
    $('#username').on('input', function () {
        const username = $(this).val().trim();
        if (username.length >= 3) {
            $('#usernameError').text('').removeClass('error')
        } else {
            $('#usernameError').text('').removeClass('valid');
        }
    });

    // Real-time validation for password
    $('#password').on('input', function () {
        const password = $(this).val().trim();
        if (password.length >= 4) {
            $('#passwordError').text('').removeClass('error')
        } else {
            $('#passwordError').text('').removeClass('valid');
        }
    });
});
