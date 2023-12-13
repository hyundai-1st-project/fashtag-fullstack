$(document).ready(function () {
    // Plus icon click event
    $(".plus-icon").on("click", function () {
        // Clone the last input field
        var newInput = $(".hashtags input:last").clone();

        // Clear the value of the cloned input
        newInput.val("");

        // Append the cloned input after the last input
        $(".hashtags").append(newInput);
    });

    // Minus icon click event
    $(".minus-icon").on("click", function () {
        // Check if there is more than one input
        if ($(".hashtags input").length > 1) {
            // Remove the last input
            $(".hashtags input:last").remove();
        }
    });
});



$(document).ready(function () {
    // Input file change event
    $("#input-image").on("change", function () {
        // Get the selected file
        var file = this.files[0];

        // Check if a file is selected
        if (file) {
            // Read the file as a data URL
            var reader = new FileReader();
            reader.onload = function (e) {
                // Set the src attribute of the post-image class to the data URL
                $(".post-image").attr("src", e.target.result);
            };
            reader.readAsDataURL(file);
        }
    });
});

$(document).ready(function () {
    // Cancel button click event
    $("#cancelButton").on("click", function () {
        // Show a confirmation alert
        var isConfirmed = confirm("작성을 취소하시겠습니까?");
        // If the user clicks "OK" in the confirmation alert, redirect to /posts
        if (isConfirmed) {
            window.location.href = "/posts";
        }
        // If the user clicks "Cancel" in the confirmation alert, do nothing
    });

    // Form submit event
    $("#postForm").on("submit", function (event) {

        if ($("#input-image")[0].files.length === 0) {
            // Show an alert or handle the case when no image is selected
            alert("이미지를 업로드하세요.");
            event.preventDefault(); // Prevent form submission
        }
        // Filter out empty input fields before submitting the form
        $("input[name='hashtags']").each(function() {
            let currentValue = $.trim($(this).val());
            if (currentValue !== "" && !currentValue.startsWith("#")) {
                var modifiedValue = "#" + currentValue;
                $(this).val(modifiedValue.trim());
            }

            if (currentValue.trim() === "" || currentValue.trim()  === "#") {
                $(this).prop("disabled", true);
            }

        });
    });


});