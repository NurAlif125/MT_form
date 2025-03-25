
<link href="css/toastify.min.css" rel="stylesheet" type="text/css">
<script src="js/toastify-js.js"></script>
<script type="text/javascript">
let previousNotifCount = sessionStorage.getItem("notifCount") || 0;

function fetchNotifications() {
    $.ajax({
        url: "NotifServlet",
        method: "GET",
        dataType: "json",
        success: function (data) {
            let currentNotifCount = data.count;
            let notifCountElement = $("#notifCount");

            if (currentNotifCount === 0) {
                $("#checkAll").css({ display: "none" });
                notifCountElement.attr("hidden", true);
                notifCountElement.css({ display: "none", background: "transparent"});
            } else {
                $("#checkAll").css({ display: "" });
                notifCountElement.attr("hidden", false);
                notifCountElement.css({ display: "block", background: "red"});
                notifCountElement.text(currentNotifCount > 99 ? "99+" : currentNotifCount);
            }

            if (previousNotifCount > 0 && currentNotifCount > previousNotifCount) {
                let countNewNotif = currentNotifCount - previousNotifCount;
//                alert(`Anda memiliki ${countNewNotif} notifikasi baru!`);
                console.log("count new notifcation"+countNewNotif)
                Toastify({
                    text: `Anda memiliki ${countNewNotif} notifikasi baru!`,
                    duration: 3000,
                    close: true,
                    gravity: "bottom",
                    position: "right",
                }).showToast();
            }

            sessionStorage.setItem("notifCount", currentNotifCount);
            previousNotifCount = currentNotifCount;

            console.log(currentNotifCount);
        },
        error: function (xhr, status, error) {
            console.error("Error fetching notifications:", error);
        }
    });
}

fetchNotifications();
setInterval(fetchNotifications, 5000);
        
function fetchNotificationList() {
    $.getJSON("SCNotificationList", function (data) {
        let notifList = $("#notifList");
        notifList.empty(); // Bersihkan list sebelum diisi ulang

        if (data.length === 0) {
            notifList.append('<tr><td colspan="3" style="padding:2px; text-align:center;">No Notifications</td></tr>');
        } else {
            data.forEach((notif) => {
                 let title = notif.title ? notif.title.trim() : "";
                let message = notif.message ? notif.message.trim() : "";


               let row = $("<tr>").addClass("tbl-tr-notif").attr("onclick", "showDetail('"+message+"')");;
                let checkboxCell = $("<td>").addClass("tbl-td-notif").append(
                    $("<input>").attr({
                        type: "checkbox",
                        class: "notifCheckbox",
                        value: notif.id
                    }).css("cursor", "pointer").attr("onclick","event.stopPropagation()")
                );
                let titleCell = $("<td>").addClass("tbl-td-notif").text(title);
                let messageCell = $("<td>").addClass("tbl-td-notif").html(message);

                row.append(checkboxCell, titleCell, messageCell);
                notifList.append(row);
            });
        }
    });
}

function markAsRead() {
//    let selectedIds = $(".notifCheckbox:checked").map(function() {
//        return this.value;
//    }).get();
//
//    if (selectedIds.length === 0) {
//        alert("Pilih setidaknya satu notifikasi!");
//        return;
//    }
//
//    $.ajax({
//        url: "SCNotificationRead",
//        type: "POST",
//        contentType: "application/json",
//        data: JSON.stringify({ notifIds: selectedIds }),
//        success: function(response) {
//            alert("Notifikasi telah ditandai sebagai sudah dibaca!");
//            fetchNotificationList(); // Refresh daftar notifikasi
//        },
//        error: function() {
//            alert("Gagal memperbarui notifikasi!");
//        }
//    });
    
    
//    $(document).ready(function () {
//    $("#btn-read").on("click", function () {
        let checkedNotifs = [];
        $(".notifCheckbox:checked").each(function () {
            checkedNotifs.push($(this).val());
        });

        if (checkedNotifs.length === 0) {
            alert("Pilih setidaknya satu notifikasi!");
            return;
        }
        
        console.log("msg is read: "+checkedNotifs);
        
         $.ajax({
                type: "POST",
                url: "markAsReadNotif",
                data: {
                    readNotif: checkedNotifs.join(',')
                },
                success: function (response) {
                    console.log(response)
                    console.log(response.status)
                    if (response.status == "success") {
                        fetchNotificationList()
                        fetchNotifications()
                        console.log("berhasil read notification")
                    } else {
                        console.log("gagal read notification")
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error fetching notifications:", error);
                }
        }); 

//        fetch("markAsReadNotif", {
//            method: "POST",
//            headers: {
//                "Content-Type": "application/x-www-form-urlencoded"
//            },
//            body: JSON.stringify({ readNotif: checkedNotifs })
//        })
//        .then(response => response.text())
//        .then(data => {
//            console.log("data:" + data)
//            fetchNotificationList()
//            fetchNotifications()
//        })
//        .catch(error => console.error("Error:", error));

//    });
//});

}

function openModal() {
    fetchNotificationList();
    $("#notifModal").css({ display: "block" });
    $("#btn-read").prop('hidden', false);
}

function closeModal() {
    $("#notifModal").css({ display: "none" });
    resetModal();
//    $("#tableList").css({ display: "block" });
//    $('#checkAll').attr('checked', false); 
    $("#notifList").css({ display: "" });
    $("#notifDetail").css({ display: "none" });
    $("#tableList").css({ display: "" });
    $('#checkAll').prop('checked', false);
    $("#btn-read").prop('hidden', false);
}

function showDetail(msgDetail) {

    $("#detailContent a").css({"text-decoration": "none", "color": "#20696d", "font-weight": "bold"});
    $("#detailContent").html(msgDetail);
    $("#notifList").css({display: "none"});
    $("#tableList").css({display: "none"});
    $("#notifDetail").css({display: "block"});
    $("#btn-read").prop('hidden', true);
}

function backToList() {
    $("#notifList").css({ display: "" });
    $("#notifDetail").css({ display: "none" });
    $("#tableList").css({ display: "" });
//    $('#checkAll').attr('checked', false);
    $('#checkAll').prop('checked', false);
    $("#btn-read").prop('hidden', false);
}

function outsideClick(event) {
    let modal = document.getElementById("notifModal");
    let modalContent = document.querySelector(".modal-content");

    if (event.target === modal) {
        closeModal();
        resetModal();
        $("#notifList").css({ display: "" });
        $("#notifDetail").css({ display: "none" });
        $("#tableList").css({ display: "" });
//        $('#checkAll').attr('checked', false);
        $('#checkAll').prop('checked', false);
        $("#btn-read").prop('hidden', true);
    }
}

function resetModal() {
    $("#notifList").css({ display: "" });
    $("#notifDetail").css({ display: "none" });
}

function toggleAllCheckboxes() {
    let isChecked = $("#checkAll").prop("checked");
    $(".notifCheckbox").prop("checked", isChecked);
}
    
    
    
    
</script>
