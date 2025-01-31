                        <div id="content">
                            <%int rowNum = 1;%>
                            <display:table name="sessionScope.STPLimit" pagesize="8" export="false" sort="list" cellpadding="0" cellspacing="0">
                                <display:column value="<%=rowNum++%>" title="No" sortable="true" headerClass="sortable" />
                                <display:column paramId="id" paramProperty="id" property="limit" title="Limit" sortable="true" headerClass="sortable" href="VSTPLimit" />
                                <display:column property="updateBy" title="Update By" sortable="true" headerClass="sortable" />
                                <display:column property="tanggal" title="Last Update" sortable="true" headerClass="sortable" />
                                <display:column property="currency" title="Currency" sortable="true" headerClass="sortable" />
                            </display:table>
            </div>