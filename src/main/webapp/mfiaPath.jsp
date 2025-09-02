<%@ include file="header.jsp" %>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/jquery.lavalamp.min.js"></script>
<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.22.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.22.custom.min.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script  type="text/javascript" src="rule/validate_rule_fia_config_path.js"></script>

<div id="isi">
    <c:forEach var="roleItem" items="${role}">
        <c:if test="${roleItem == 'FIAPATHCONF:VIEW'}">
            <div id="judul">Add FIA Path config
                <c:forEach var="roleItem2" items="${role}">
                    <c:if test="${roleItem2 == 'FIAPATHCONF:LIST'}">
                        <a href="SCFIAPathList" class="srb3">FIA Path config List</a>
                    </c:if>
                </c:forEach>
            </div>
            <form id="form1" name="form1" method="post" action="SCFIAPath">
                <input type="hidden" name="id" id="id" value="<%=request.getParameter("id")%>" />
                <div id="tabs-1" class="formBody">
                    <div class="form-row">
                        <span class="labelL3">Source</span>
                        <input autocomplete="off" style="width:300px;" type="text" name="source" id="source" maxlength="255" value="<c:out value='${fiaById.source}' />" /> 
                    </div>
                    
                    <div class="form-row">
                        <span class="labelL3">Protocol</span>                       
                        <select name="protocol" id="protocol">
                            <option value="" <c:if test="${fiaById.protocol == 'MFT'}">selected</c:if>>MFT</option>
                            <option value="SFTP" <c:if test="${fiaById.protocol == 'SFTP'}">selected</c:if>>SFTP</option>
                            <option value="FTP" <c:if test="${fiaById.protocol == 'FTP'}">selected</c:if>>FTP</option>
                            <option value="FTPS" <c:if test="${fiaById.protocol == 'FTPS'}">selected</c:if>>FTPS</option>
                        </select>
                        <%--<input type="text" name="protocol" id="protocol" maxlength="12" value="<c:out value='${fiaById.protocol}' />" /> --%>
                    </div>
                    
                    <div id="divNonLocal">
                        <div class="form-row">
                            <span class="labelL3">Host</span>
                            <input autocomplete="off" type="text" name="host" id="host" maxlength="50" value="<c:out value='${fiaById.host}' />" /> 
                        </div>

                        <div class="form-row">
                            <span class="labelL3">Port</span>
                            <input autocomplete="off" type="text" name="port" id="port" maxlength="12" value="<c:out value='${fiaById.port}' />" /> 
                        </div>

                        <div class="form-row">
                            <span class="labelL3">User Name</span>
                            <input autocomplete="off" type="text" name="userName" id="userName" maxlength="50" value="<c:out value='${fiaById.userName}' />" /> 
                        </div>

                        <div class="form-row">
                            <span class="labelL3">Password</span>
                            <input type="password" name="password" id="password" maxlength="50" value="<c:out value='${fiaById.password}' />" /> 
                        </div>
                    </div>
                    
                    
                    
                    <div id="divSFTP">
                        <div class="form-row">
                            <span class="labelL3">Client Authentication Type</span>                        
                            <select name="clientAuthenticationTypeSFTP" id="clientAuthenticationTypeSFTP">
                                <option value="Password" <c:if test="${fiaById.clientAuthenticationType == 'Password'}">selected</c:if>>Password</option>
                                <option value="Private Key" <c:if test="${fiaById.clientAuthenticationType == 'Private Key'}">selected</c:if>>Private Key</option>
                                <option value="Both" <c:if test="${fiaById.clientAuthenticationType == 'Both'}">selected</c:if>>Both</option>
                            </select>
                        </div>
                        
                        <div class="form-row">
                            <span class="labelL3">Private Key Type</span>
                            <input autocomplete="off" type="text" name="privateKeyType" id="privateKeyType" maxlength="4" value="<c:out value='${fiaById.privateKeyType}' />" /> 
                        </div>
                        
                        <div class="form-row">
                            <span class="labelL3">Private Key Path</span>
                            <input autocomplete="off" type="text" name="privateKeyPath" id="privateKeyPath" maxlength="255" value="<c:out value='${fiaById.privateKeyPath}' />" /> 
                        </div>
                        
                        <div class="form-row">
                            <span class="labelL3">Key File Password</span>
                            <input type="password" name="keyFilePassword" id="keyFilePassword" maxlength="255" value="<c:out value='${fiaById.keyFilePassword}' />" /> 
                        </div>
                    </div>
                        
                    <div id="divFTPS">
                        <div class="form-row">
                            <span class="labelL3">Client Authentication Type</span> 
                            <select name="clientAuthenticationTypeFTPS" id="clientAuthenticationTypeFTPS">
                                <option value="Password" <c:if test="${fiaById.clientAuthenticationType == 'Password'}">selected</c:if>>Password</option>
                                <option value="Password and Keystore" <c:if test="${fiaById.clientAuthenticationType == 'Password and Keystore'}">selected</c:if>>Password and Keystore</option>
                            </select>
                        </div>
                        
                        <div class="form-row">
                            <span class="labelL3">Private Key Password</span>
                            <input type="password" name="privateKeyPassword" id="privateKeyPassword" maxlength="50" value="<c:out value='${fiaById.privateKeyPassword}' />" /> 
                        </div>
                        
                        <div class="form-row">
                            <span class="labelL3">Key Store File</span>
                            <input autocomplete="off" type="text" name="keyStoreFile" id="keyStoreFile" maxlength="255" value="<c:out value='${fiaById.keyStoreFile}' />" /> 
                        </div>

                        <div class="form-row">
                            <span class="labelL3">Key Store Password</span>
                            <input type="text" name="keyStorePassword" id="keyStorePassword" maxlength="255" value="<c:out value='${fiaById.keyStorePassword}' />" /> 
                        </div>

                        <div class="form-row">
                            <span class="labelL3">Key Store Alias</span>
                            <input autocomplete="off" type="text" name="keyStoreAlias" id="keyStoreAlias" maxlength="255" value="<c:out value='${fiaById.keyStoreAlias}' />" /> 
                        </div>
                    </div>
                    
                    
                    <div class="form-row">
                        <span class="labelL3">PUT or GET</span>
                        <input type="checkbox" name="isPutOrGet" id="isPutOrGet" value="1"
                               <c:if test="${fiaById.transferPath != '' and fiaById.transferPath != null}">checked</c:if> />    
                        <small>On as a PUT and Off as a GET</small>
                    </div>
                        
                    <div id="divPath" class="form-row">
                        <span class="labelL3">Path</span>
                        <input autocomplete="off" type="text" name="path" id="path" maxlength="255" value="<c:out value='${fiaById.path}' />" /> 
                    </div>
                    
                    <div id="divTransferPath" class="form-row">
                        <span class="labelL3">Transfer Path</span>
                        <input autocomplete="off" type="text" name="transferPath" id="transferPath" maxlength="255" value="<c:out value='${fiaById.transferPath}' />" /> 
                    </div>
                    
                    
                    <div class="form-row">
                        <span class="labelL3">Local Path</span>
                        <input autocomplete="off" type="text" name="localPath" id="localPath" maxlength="255" value="<c:out value='${fiaById.localPath}' />" /> 
                    </div>
                    
                    <div class="form-row">
                        <span class="labelL3">Description</span>
                        <input autocomplete="off" type="text" name="configName" id="configName" maxlength="255" value="<c:out value='${fiaById.configName}' />" /> 
                    </div>
                    
                    <div class="form-row">
                        <span class="labelL3">Enable</span>
                        <label for="isenable_checkbox">
                            <input type="checkbox" name="isenable" id="isenable_checkbox" value="1"
                                <c:if test="${fiaById.isEnable == '1'}">checked</c:if> />                           
                        </label>
                    </div>
                </div>
                <div class="form-row-action">
                    <c:forEach var="roleItem2" items="${role}">
                        <c:if test="${roleItem2 == 'FIAPATHCONF:ADD' and empty fiaById.source}">
                            <input type="submit" name="submit" id="submit" value="Save" />
                        </c:if>
                        <c:if test="${roleItem2 == 'FIAPATHCONF:UPDATE' and not empty fiaById.source}">
                            <input type="submit" name="submit" id="submit" value="Update" />
                        </c:if>
                        
                    </c:forEach>
                    
                    <input type="reset" name="reset" id="reset" value="Reset" />
                    <input type="button" name="back" id="back" value="Back" />
                </div>
            </form>
        </c:if>
    </c:forEach>
</div>
