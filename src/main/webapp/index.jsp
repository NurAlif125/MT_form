<%-- 
    Document   : index
    Created on : Aug 21, 2025, 9:32:34 AM
    Author     : mslam
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home - Form MT</title>
<style>
  body{font-family:Arial,Helvetica,sans-serif;margin:0;background:#f4f8fa;color:#1f3b44}
  /* NAVBAR */
  .navbar{background:#2a7d80;display:flex;gap:8px;padding:0 10px}
  .nav-item{position:relative}
  .nav-btn{color:#fff;padding:14px 18px;display:block;text-decoration:none;font-weight:600}
  .nav-btn:hover{background:#1b575a}
  .menu{display:none;position:absolute;top:100%;left:0;background:#2d7f82;
        min-width:260px;box-shadow:0 4px 10px rgba(0,0,0,.15);z-index:5}
  .nav-item:hover>.menu{display:block}
  .menu a{display:block;color:#dfeff0;text-decoration:none;padding:12px 16px}
  .menu a:hover{background:#256a6c}
  /* sub menu (kategori) */
  .sub{position:relative}
  .submenu{display:none;position:absolute;left:100%;top:0;background:#2d7f82;min-width:300px;
           box-shadow:0 4px 10px rgba(0,0,0,.15)}
  .sub:hover>.submenu{display:block}
  .arrow{float:right;opacity:.7}
  /* Welcome */
  .wrap{max-width:980px;margin:120px auto 40px auto;text-align:center}
  h1{font-size:36px;margin:0 0 10px}
  p{font-size:18px;margin:0}
</style>
</head>
<body>

<div class="navbar">
  <div class="nav-item">
    <a class="nav-btn" href="#">Create Message ▾</a>
    <div class="menu">
      <!-- MT -->
      <div class="sub">
        <a href="#">MT <span class="arrow">▸</span></a>
        <div class="submenu">
          <div class="sub">
            <a href="#">Message Category 1 <span class="arrow">▸</span></a>
            <div class="submenu">
              <a href="Category1/mt110.jsp">110 - Advice of Cheque(s)</a>
              <a href="Category1/mt111.jsp">111 - Request for Stop Payment of a Cheque</a>
            </div>
          </div>
          <div class="sub">
            <a href="#">Message Category 2 <span class="arrow">▸</span></a>
            <div class="submenu">
              <a href="Category2/mt210.jsp">210 - Notice to Receive</a>
            </div>
          </div>  
          <div class="sub">
            <a href="#">Message Category 7 <span class="arrow">▸</span></a>
            <div class="submenu">
              <a href="Category7/mt700.jsp">700 - Issue of a Documentary Credit</a>
              <a href="Category7/mt701.jsp">701 - Issue of a Documentary Credit (Continuation)</a>
              <a href="Category7/mt707.jsp">707 - Amendment to a Documentary Credit</a>
              <a href="Category7/mt708.jsp">708 - Amendment to a Documentary Credit (Continuation)</a>
              <a href="Category7/mt710.jsp">710 - Advice of a Third Bank's or a Non-Bank's Documentary Credit</a>
              <a href="Category7/mt711.jsp">711 - Issue of a Documentary Credit (Continuation)</a>
              <a href="Category7/mt720.jsp">720 - Transfer of a Documentary Credit</a>
              <a href="Category7/mt730.jsp">730 - Acknowledgement</a>
              <a href="Category7/mt734.jsp">734 - Advice of Refusal</a>
              <a href="Category7/mt740.jsp">740 - Authorisation to Reimburse</a>
              <a href="Category7/mt742.jsp">742 - Reimbursement Claim</a>
              <a href="Category7/mt747.jsp">747 - Amendement to an Authorisation to Reimburse</a>
              <a href="Category7/mt750.jsp">750 - Advice of Discrepancy</a>             
              <a href="Category7/mt752.jsp">752 - Authorisation to Pay, Accept or Negotiate</a>             
              <a href="Category7/mt754.jsp">754 - Advice of Payment/Acceptance/Negotiation</a>             
              <a href="Category7/mt756.jsp">756 - Advice of Reimbursement or Payment</a>             
              <a href="Category7/mt759.jsp">759 - Ancillary Trade Structured Message</a>             
              <a href="Category7/mt760.jsp">760 - Issue of a Demand Guarantee/Standby Letter of Credit</a>             
              <a href="Category7/mt761.jsp">761 - Issue of a Demand Guarantee/Standby Letter of Credit</a>             
              <a href="Category7/mt767.jsp">767 - Amendment to a Demand Guarantee/Standby Letter of Credit</a>             
            </div>
          </div>
        </div>
      </div>
      <div class="sub">
        <a href="#">MX <span class="arrow">▸</span></a>
        <div class="submenu">
          <a href="#">MX Category 1</a>
          <a href="#">MX Category 2</a>
        </div>
      </div>
    </div>
  </div>

  <div class="nav-item">
    <a class="nav-btn" href="#">Reporting ▾</a>
    <div class="menu">
      <a href="Category1/listForms.jsp">Category 1</a>
      <a href="Category2/listForms.jsp">Category 2</a>
      <a href="Category7/listForms.jsp">Category 7</a>
    </div>
  </div>
</div>

<div class="wrap">
  <h1>Welcome to Message Form System</h1>
  <p>Please use the menu above to create or view messages.</p>
</div>

</body>
</html>
