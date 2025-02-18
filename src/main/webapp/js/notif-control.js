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
                alert(`Anda memiliki ${countNewNotif} notifikasi baru!`);
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
                let messageCell = $("<td>").addClass("tbl-td-notif").text(message);

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
}

function showDetail(msgDetail) {
    let detailText = "";

    document.getElementById("detailContent").innerText = msgDetail;
    document.getElementById("notifList").style.display = "none";
    document.getElementById("tableList").style.display = "none";
    document.getElementById("notifDetail").style.display = "block";
}

function backToList() {
    $("#notifList").css({ display: "" });
    $("#notifDetail").css({ display: "none" });
    $("#tableList").css({ display: "" });
}

function outsideClick(event) {
    let modal = document.getElementById("notifModal");
    let modalContent = document.querySelector(".modal-content");

    if (event.target === modal) {
        closeModal();
        resetModal();
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