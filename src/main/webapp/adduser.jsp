<%--
    Document  adduser
    Created onJan 31, 2013, 5:36:52 PM
    Author    hadi
--%>

<%@ include file="header.jsp" %>
<%@ include file="rule/validate_user.jsp" %>
<script src="js/mt.js" type="text/javascript"></script>
<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />
<style>
  .suggestions {
    margin-left: 80px;
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
    width:150px;
    background: white;
    z-index: 10;
    max-height: 150px;
    overflow-y: auto;
  }
  
  .show-border {
      border: 1px solid #ccc;
  }

  .suggestions .suggestion-item {
    padding: 5px 10px;
    cursor: pointer;
  }

  .suggestions .suggestion-item:hover {
    background-color: #f0f0f0;
  }
</style>


<div id="isi">
<c:forEach var="item" items="${role}">
    <c:if test="${item == 'USER:ADD'}">
        <div id="judul">Add User
                <c:forEach var="item" items="${role}">
                    <c:if test="${item == 'USER:LIST'}">
                        <a href="SCDataUserList" class="srb3">User List</a>
                    </c:if>
                </c:forEach>
            </div>
            <div id="tabs-1">
            <form id="form1" name="form1" method="post" action="SCDataUser">
                <input type="hidden" name="user_id" id="user_id" value="<%=request.getParameter("user_id")%>" />
                <div id="tabs-1" class="formBody">
                    <div class="form-row">
                        <span class="labelL2">Full Name</span>
                        <input type="text" name="name" id="name" maxlength="255" value="<c:out value='${dataUserById.name}' />" />
                    </div>

                    <div class="form-row"><span class="labelL2">User ID</span>
                        <input type="text" name="username" id="username" maxlength="255" value="<c:out value="${dataUserById.user_id}" />" <% if(request.getParameter("user_id")==null) { %> <% } else { %> disabled="disabled" <% } %> />
                    </div>
                    <%--
                    <div class="form-row"><span class="labelL2">Status New</span>
                        <input type="text" name="status_new" id="status_new" maxlength="45" value="<c:out value="${dataUserById.status_new}" />" />
                    </div>
                    <div class="form-row"><span class="labelL2">User Routing</span>
                        <input type="text" name="user_mt_routing" id="user_mt_routing" maxlength="45" value="<c:out value="${dataUserById.user_mt_routing}" />" />
                    </div>
                    --%>
                    <div class="form-row"><span class="labelL2">Description</span>
                        <input type="text" name="description" id="description" maxlength="255" value="<c:out value="${dataUserById.description}" />" />
                    </div>
                    <div class="form-row"><span class="labelL2">Role</span>
                        <select name="role" id="role">
                            <option value=""></option>
                            <c:forEach var="item" items="${dataRoleList}">
                                <option value="${item.role_id}" <c:if test="${item.role_id == dataUserById.role}"> selected="true" </c:if> 
                                <c:if test="${item.role_enable == 0 || item.role_enable == 2}"> hidden="true" </c:if> >${item.role_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-row" id="sub-role-container" style="display: none;">
                        <span class="labelL2">Sub-Role</span>
                        <label style="margin-right: 13px;">
                            <input required type="radio" name="subrole" value="1" <c:if test="${dataUserById.sub_role == '1'}"> checked="true" </c:if> />Checker
                        </label>
                        <label>
                            <input required type="radio" name="subrole" value="2" <c:if test="${dataUserById.sub_role == '2'}"> checked="true" </c:if> />Maker
                        </label>
                    </div>
                    <div class="form-row"><span class="labelL2">Channel</span>
                        <select name="channel" id="channel">
                            <option value="">All Channel</option>
                        <c:forEach var="item1" items="${dataChannel}">
                            <option value="${item1}"<c:if test="${item1 == dataUserById.channel}"> selected="true" </c:if>>${item1}</option>
                        </c:forEach>
                        </select>
                    </div>
                        
                    <div class="form-row" hidden><span class="labelL2">BIC</span>
                        <select name="user_bic" id="user_bic">
                            <option value="">All BIC</option>
                        <c:forEach var="item1" items="${dataBicProp}">
                            <option value="${item1}"<c:if test="${item1 == dataUserById.user_bic}"> selected="true" </c:if>>${item1}</option>
                        </c:forEach>
                        </select>
                    </div>
                     
<!--                    <div class="form-row"><span class="labelL2">BIC</span>
                        <div class="autocomplete-container" style="position: relative;">
                          <input type="text" id="searchBIC" name="biccode" placeholder="BIC...">
                          <div id="dataSource" style="display: none;">
                            <c:forEach var="itemBic" items="${dataBicProp}">
                              <div class="bic-item">${itemBic}</div>
                            </c:forEach>
                          </div>
                          <div id="suggestions" class="suggestions"></div>
                        </div>
                    </div>-->
                     
                    <div class="form-row"><span class="labelL2">Enable</span>
                        <input type="checkbox" name="enable" id="enable" value="1" 
                            <c:if test="${dataUserById.enable == '1'}"> checked="true" </c:if>
                            <c:if test="${sessionScope.sub_role_user == '2'}"> onclick="return false;" style="accent-color: #ccc;" </c:if>
                        />
                    </div>
<%--                    <div class="form-row"><span class="labelL2">Auto Disable</span>
                        <input type="text" name="auto_disable" id="auto_disable" maxlength="3" required="true" value="<c:out value="${dataUserById.auto_disable}" />" onkeypress="return numbersonly(event);" />
                    </div>--%>
                </div>
<!--                <div class="form-row"><span class="labelL2">&nbsp;</span>-->
                <div class="form-row-action">
                    <input type="submit" name="submit" id="submit" value="Save" />
                    <c:if test="${sessionScope.sub_role_user == '1'}">
                    <input type="button" name="delete_user" id="delete_user" value="Disable Permanent" />
                    </c:if>
                    <!--<input type="button" name="delete_user" id="delete_user" value="Delete" />-->
                    <% if(null == request.getParameter("user_id")) { %>
                        <input type="reset" name="reset" id="reset" value="Reset" />
                    <% } %>
                    <input type="button" name="back" id="back" value="Back" />
                </div>
            </form>
            <div id="dialog"></div>
        </div>
    </c:if>
</c:forEach>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {
      const roleSelect = document.getElementById("role");
      const subRoleContainer = document.getElementById("sub-role-container");
      const subRoleRadios = document.querySelectorAll('input[name="subrole"]');

      function handleRoleChange() {
        const selectedOption = roleSelect.options[roleSelect.selectedIndex];
        const selectedText = selectedOption ? selectedOption.textContent.toLowerCase() : "";

        if (selectedText.includes("adm")) {
          subRoleContainer.style.display = "block";
          subRoleRadios.forEach(radio => radio.setAttribute("required", "required"));
        } else {
          subRoleContainer.style.display = "none";
          subRoleRadios.forEach(radio => {
            radio.removeAttribute("required");
            radio.checked = false;
          });
        }
      }

    if (roleSelect) {
      roleSelect.addEventListener("change", handleRoleChange);
     handleRoleChange(); // jalan sekali saat load
    }
  });
</script>

<script>
  function updateBicOptions() {
    let $channel = $("#channel");
    let $bic = $("#user_bic");

    let selectedIndex = $channel.prop("selectedIndex");
    let selectedValue = $channel.val();

    $bic.find("option").show();
    if (selectedIndex === 0) {
      $bic.prop("selectedIndex", 0);
      return;
    }

    if (selectedValue === "Treasury OPS") {
      let allowed = ["BDINIDJAXTRS", "BDINIDJAXXXX"];
      $bic.find("option").each(function () {
        if (!allowed.includes($(this).val())) {
          $(this).hide(); // hide yg bukan
        }
      });

      if (!allowed.includes($bic.val())) {
        $bic.val("BDINIDJAXTRS"); // auto select yg ini jika TSA
      }
    } else {
      $bic.find("option").each(function (i) {
      if (i === selectedIndex) {
        $(this).show();
      } else {
        $(this).hide();
      }
      });
      $bic.prop("selectedIndex", selectedIndex);
    }
  }

  $("#channel").on("change", updateBicOptions);

  $(document).ready(updateBicOptions);  
</script>

<script>
  const input = document.getElementById('searchBIC');
  const suggestionsContainer = document.getElementById('suggestions');

  // Ambil data dari elemen yang diloop oleh JSTL
  const allItems = Array.from(document.querySelectorAll('#dataSource .bic-item')).map(div => div.textContent);

  input.addEventListener('input', () => {
    const query = input.value.trim().toLowerCase();
    suggestionsContainer.innerHTML = '';

    if (!query) return;

    const filtered = allItems.filter(item => item.toLowerCase().includes(query));

    filtered.forEach(item => {
      const div = document.createElement('div');
      div.classList.add('suggestion-item');
      div.textContent = item;
      div.onclick = () => {
        input.value = item;
        suggestionsContainer.innerHTML = '';
      };
      suggestionsContainer.appendChild(div);
    });
  });
  
    if (filtered.length > 0) {
      suggestionsContainer.classList.add('show-border');
    } else {
      suggestionsContainer.classList.remove('show-border');
    }

  document.addEventListener('click', e => {
    if (!e.target.closest('.autocomplete-container')) {
      suggestionsContainer.innerHTML = '';
    }
  });
</script>


<!--<div id="kaki">
    <p><a href="http://www.vensys.co.id" target="_blank">Copyright &copy; PT. Venturium System Indonesia</a></p>
</div>-->