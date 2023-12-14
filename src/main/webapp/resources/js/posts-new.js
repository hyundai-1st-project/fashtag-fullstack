$(document).ready(function () {
    $(".plus-icon").on("click", function () {
        var newInput = $(".hashtags input:last").clone();
        newInput.val("");
        $(".hashtags").append(newInput);
    });

    $(".minus-icon").on("click", function () {
        if ($(".hashtags input").length > 1) {
            $(".hashtags input:last").remove();
        }
    });
});



$(document).ready(function () {
    $("#input-image").on("change", function () {
        var file = this.files[0];

        if (file) {
            var reader = new FileReader();
            reader.onload = function (e) {
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

    $("#update-cancel").on("click", function () {
        // Show a confirmation alert
        var isConfirmed = confirm("수정을 취소하시겠습니까?");
        // If the user clicks "OK" in the confirmation alert, redirect to /posts
        if (isConfirmed) {
            window.location.href = "/posts/"+postId;
        }
        // If the user clicks "Cancel" in the confirmation alert, do nothing
    });

    $("#postForm").on("submit", function (event) {

        if ($("#input-image")[0].files.length === 0 && window.location.pathname === "/posts/"+postId) {
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

    $("#update-post").on("submit", function (event) {
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