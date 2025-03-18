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
                notifCountElement.attr("hidden", true);
            } else {
                notifCountElement.attr("hidden", false);
                notifCountElement.text(currentNotifCount > 99 ? "99+" : currentNotifCount);
            }

            if (previousNotifCount > 0 && currentNotifCount > previousNotifCount) {
                let countNewNotif = currentNotifCount - previousNotifCount;
//                alert(`Anda memiliki ${countNewNotif} notifikasi baru!`);
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

setInterval(fetchNotifications, 2000);
        
function fetchNotificationList() {
    $.getJSON("SCNotificationList", function (data) {
        let notifList = $("#notifList");
        notifList.empty(); // Bersihkan list sebelum diisi ulang

        if (data.length === 0) {
            notifList.append('<tr><td colspan="3" style="padding:2px;">No Notifications</td></tr>');
        } else {
            data.forEach((notif) => {
                 let title = notif.title ? notif.title.trim() : "";
                let message = notif.message ? notif.message.trim() : "";
                console.log(title)

                console.log("Menambahkan notifikasi:", title, message);

               let row = $("<tr>").addClass("tbl-tr-notif").attr("onclick", "showDetail('"+message+"')");;
                let checkboxCell = $("<td>").addClass("tbl-td-notif").append(
                    $("<input>").attr({
                        type: "checkbox",
                        class: "notifCheckbox",
                        value: notif.id
                    }).attr("onclick","event.stopPropagation()")
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
    let selectedIds = $(".notifCheckbox:checked").map(function() {
        return this.value;
    }).get();

    if (selectedIds.length === 0) {
        alert("Pilih setidaknya satu notifikasi!");
        return;
    }

    $.ajax({
        url: "SCNotificationRead",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({ notifIds: selectedIds }),
        success: function(response) {
            alert("Notifikasi telah ditandai sebagai sudah dibaca!");
            fetchNotificationList(); // Refresh daftar notifikasi
        },
        error: function() {
            alert("Gagal memperbarui notifikasi!");
        }
    });
}

function openModal() {
    fetchNotificationList();
    $("#notifModal").css({ display: "block" });
}

function closeModal() {
    $("#notifModal").css({ display: "none" });
    resetModal();
    $("#tableList").css({ display: "block" });
//    $('#checkAll').attr('checked', false); 
    $('#checkAll').prop('checked', false);
}

function showDetail(msgDetail) {

    $("#detailContent a").css({"text-decoration": "none", "color": "#20696d", "font-weight": "bold"});
    $("#detailContent").html(msgDetail);
    $("#notifList").css({display: "none"});
    $("#tableList").css({display: "none"});
    $("#notifDetail").css({display: "block"});
}

function backToList() {
    $("#notifList").css({ display: "" });
    $("#notifDetail").css({ display: "none" });
    $("#tableList").css({ display: "" });
//    $('#checkAll').attr('checked', false);
    $('#checkAll').prop('checked', false);
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