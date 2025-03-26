<style>
    body {
        font-family: Arial, sans-serif;
    }
    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        transition: opacity 0.3s ease;
    }
    .modal.show {
        display: block;
        opacity: 1;
    }
    .modal-content {
        background: #fff;
        margin: 10% auto;
        padding: 20px;
        border-radius: 8px;
        width: 50%;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        animation: fadeIn 0.3s;
        text-align: center;
    }
    @keyframes fadeIn {
        from { transform: translateY(-20px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }
    .close {
        float: right;
        font-size: 20px;
        cursor: pointer;
    }
    .tableValidate tr td{
        width: 100%;
        border: 1px solid #000;
    }
</style>
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Oopss!</h2>
        <table id="tableValidate" style="width: 100%; border: 1px solid #000;">
            <thead>
                <tr>
                    <th>Message</th>
                    <th>Path</th>
                </tr>
            </thead>
            <tbody id="errorInformation">

            </tbody>
        </table>
        <!-- <div id="errorInformation" style="resize: none; width: 100%;"></div> -->
    </div>
</div>
<script>
    const modal = document.getElementById("myModal");
    const btn = document.getElementById("btn-validate");
    const closeBtn = document.querySelector(".close");
    
    btn.onclick = () => modal.classList.add("show");
    closeBtn.onclick = () => modal.classList.remove("show");
    window.onclick = (e) => { if (e.target === modal) modal.classList.remove("show"); };
</script>