<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="page-content">
    <!--Page Title-->
    <div class="page section-header text-center">
        <div class="page-title">
            <div class="wrapper">
                <h1 class="page-width">Change Your Password</h1>
            </div>
        </div>
    </div>
    <!--End Page Title-->
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-8 col-lg-8 mb-4">
                <h2>Password Change</h2>
                <p>Please choose a strong password</p>
                <div class="formFeilds contact-form form-vertical">
                    <form action="${pageContext.request.contextPath}/login/changepass.do" method="post" id="contact_form">
                        <div class="row col-10">
                            <div class="col-12 col-sm-12">
                                <div class="form-group">
                                    <input type="password" id="oldpass" name="oldpass" placeholder="Old Password" value="">
                                </div>
                            </div>
                            <div class="col-12 col-sm-12">
                                <div class="form-group">
                                    <input type="password" id="newpass" name="newpass" placeholder="New Password" value="">
                                    <span id="keyboardPatternWarning" class="error" style="display: none;">Do not use simple keyboard patterns (e.g., "qwerty", "12345").</span>
                                </div>
                            </div>
                            <div class="col-12 col-sm-12">
                                <div class="form-group">
                                    <input type="password" id="confirmpass" name="confirmpass" placeholder="Confirm Password" value="">
                                </div>
                            </div>
                            <div class="col-12 col-sm-12">
                                <input type="submit" class="btn" value="Change Password">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-12 col-sm-12 col-md-4 col-lg-4">
                <div class="password-guide">
                    <strong style="font-size: 18px;">Password Guidelines</strong><br>
                    <ul>
                        <li><strong style="font-size: 16px;">Length:</strong> Choose passwords that are at least 12 characters long. Longer passwords are generally more secure.</li>
                        <li><strong style="font-size: 16px;">Complexity:</strong> Include a mix of characters, such as uppercase letters, lowercase letters, numbers, and special characters (e.g., !, @, #, $, %, etc.). This complexity makes the password harder to guess.</li>
                        <li><strong style="font-size: 16px;">Unpredictability:</strong> Use random combinations of characters rather than easily guessable patterns or sequences.</li>
                        <li><strong style="font-size: 16px;">Avoid Personal Information:</strong> Do not include personal information, such as your name, username, or other identifiable data, in the password.</li>
                        <li><strong style="font-size: 16px;">Avoid Keyboard Patterns:</strong> Do not use simple keyboard patterns or sequences (e.g., "qwerty" or "12345").</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Form validation script -->
<script>
    $(document).ready(function () {
        // Form validation rules
        $("#contact_form").validate({
            rules: {
                newpass: {
                    required: true,
                    minlength: 12, // Minimum password length requirement (at least 12 characters)
                    strongPassword: true,
                    keyboardPattern: true
                },
                confirmpass: {
                    required: true,
                    equalTo: "#newpass" // Ensure the confirm password matches the new password
                }
            },
            messages: {
                newpass: {
                    required: "Please enter a new password.",
                    minlength: "Your password must be at least 12 characters long.",
                    keyboardPattern: "Do not use simple keyboard patterns (e.g., 'qwerty', '12345')."
                },
                confirmpass: {
                    required: "Please confirm your new password.",
                    equalTo: "Passwords do not match."
                }
            },
            errorPlacement: function (error, element) {
                // Append the error message after the input element
                error.insertAfter(element);
                if (element.attr("name") === "newpass") {
                    $("#keyboardPatternWarning").show();
                }
            },
            submitHandler: function (form) {
                form.submit();
            }
        });

        // Custom rule for checking strong password
        $.validator.addMethod("strongPassword", function (value, element) {
            // Regular expression to enforce password complexity rules
            var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{12,}$/;
            return this.optional(element) || regex.test(value);
        }, "Your password must include at least 12 characters, including at least one uppercase letter, one lowercase letter, one number, and one special character (!, @, #, $, %, *, ?, &)");


        // Custom rule for checking simple keyboard patterns
        $.validator.addMethod("keyboardPattern", function (value, element) {
            // Regular expression to detect simple keyboard patterns
            var regex = /^(?:qwerty|123456|password|12345|123456789)$/i;
            return !regex.test(value);
        }, "Do not use simple keyboard patterns (e.g., 'qwerty', '12345').");
        
        // Event listener to hide the keyboard pattern warning span when the input is valid
        $("#newpass").on("input", function () {
            if ($(this).valid()) {
                $("#keyboardPatternWarning").hide();
            }
        });
    });
</script>