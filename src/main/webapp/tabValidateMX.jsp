<%-- 
    Document   : tabValidateMX
    Created on : Apr 5, 2025, 2:39:17 AM
    Author     : HP PROBOOK 430 G8
--%>

<style>
    table {
        border-collapse: collapse;
        width:100% !important; 
        font-size:8pt !important;
    } 
    table thead {
        font-size:8pt !important;
        background: #d6d6d6;
        padding: 4px;
    }
    table tbody a{
        text-decoration: none;
        color: #20696d;
        font-weight: bold;
    }
    table tbody a:hover{
        text-decoration: underline;
    }
    table, th, td {
        border: 1px solid #000;
    }
    tbody tr td{
        padding: 4px;
        cursor: pointer;
        text-align: center;
    }
    tbody tr:hover{
        background: #f6f6f6;
    }
    
</style>

<script>
    let tableValidate = `<table>
        <thead>
            <tr>
            <th>Message</th>
            <th>Path</th>
            </tr>
        </thead>
        <tbody id="errorInformationTable"></tbody>
    </table>`;
    
    document.getElementById("error-container").innerHTML = tableValidate;
    
</script>