<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<jsp:useBean class="DAL.UserDAO" id="ud"/>--%>

<div id="page-content">
    <!--Page Title-->
    <div class="page section-header text-center">
        <div class="page-title">
            <div class="wrapper">
                <h1 class="page-width">User Profile</h1>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-12 col-md-8 col-lg-8 mb-4">
                <form action="${pageContext.request.contextPath}/login/userProfile.do" method="POST" id="profileForm">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <!-- Hidden input field to store the email value -->
                        <input type="hidden" name="email" value="${data.email}">
                        <!-- Read-only input field for display purposes -->
                        <input type="email" id="email" value="${data.email}" readonly style="background-color: #f2f2f2; padding: 8px; border: 1px solid #cccccc;">
                    </div>
                    <div class="form-group">
                        <label  for="name">Full Name</label>
                        <input  type="text" id="fullname" name="fullname" value="${data.fullName}">
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input  type="text" id="phone" name="phone" value="${data.phone}">
                    </div>
                    <div class="form-group">
                        <label for="name">Address</label>
                        <input type="text" id="address" name="address" value="${data.address}">
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn" id="editProfileBtn" value="Edit Profile" style="margin-bottom: 10px; border-radius: 4px;" disabled>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {

        // Function to validate the phone number
        function isValidPhoneNumber(phoneNumber) {
            // Regular expression to match the phone number format
            // The pattern allows either "+84" or "0" as the first number, followed by 9 digits
            var phoneRegex = /^(?:\+84|0)\d{9}$/;

            return phoneRegex.test(phoneNumber);
        }

        // Form submit event
        $("form").submit(function (event) {
            event.preventDefault(); // Prevent the form from submitting

            // Clear previous error messages and styles
            $(".error").remove();
            $(".form-group input").removeClass("invalid-input");

            // Get input values
            var fullName = $("#fullname").val().trim();
            var phone = $("#phone").val().trim();
            var address = $("#address").val().trim();


            // Basic form validation
            if (fullName === "") {
                addError("fullname", "Please enter your full name.");
                return;
            }

            // Additional fullName validation for lenght
            if (fullName.length < 3 || fullName.length > 50) {
                addError("fullname", "Full name must be between 3 and 50 characters.");
                return;
            }

            if (phone === "") {
                addError("phone", "Please enter your phone number.");
                return;
            }

            // Additional phone number validation 
            if (!isValidPhoneNumber(phone)) {
                addError("phone", "Invalid phone number format. Please enter a valid phone number with either +84 or 0 as the first digit, followed by 9 other digits.");
                return;
            }

            if (address === "") {
                addError("address", "Please enter your address.");
                return;
            }
            
             // Additional fullName validation for length
            if (address.length < 5 || address.length > 50) {
                addError("address", "Address must be between 5 and 50 characters.");
                return;
            }

            // If all fields are valid, you can submit the form
            $("form").unbind("submit").submit();
        });

        // Function to add error message and highlight the field
        function addError(fieldId, errorMessage) {
            $("#" + fieldId).addClass("invalid-input");
            $("#" + fieldId).after("<div class='error'>" + errorMessage + "</div>");
        }
    });
</script>
<!<!-- no change check -->
<script>
  $(document).ready(function () {
    var initialFormData = $("#profileForm").serialize();

    // Function to check for changes and enable/disable the Edit Profile button
    function checkForChanges() {
      var currentFormData = $("#profileForm").serialize();
      if (currentFormData === initialFormData) {
        $("#editProfileBtn").prop("disabled", true);
      } else {
        $("#editProfileBtn").prop("disabled", false);
      }
    }

    // Trigger checkForChanges on form field changes
    $("#profileForm input, #profileForm textarea").on("input", function () {
      checkForChanges();
    });

    // Initial check on page load
    checkForChanges();
  });
</script>