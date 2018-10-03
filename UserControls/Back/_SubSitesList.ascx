﻿<%@ Control Language="VB" AutoEventWireup="false" CodeFile="_SubSitesList.ascx.vb"
    Inherits="UserControls_Back_SubSiteList" %>
<%@ Register TagPrefix="_user" TagName="ItemPager" Src="~/UserControls/Back/_ItemPagerAjax.ascx" %>
<%@ Register TagPrefix="_user" TagName="DispatchLabels" Src="~/UserControls/Back/_DispatchLabels.ascx" %>
<%@ Register TagPrefix="_user" TagName="AutoComplete" Src="~/UserControls/Back/_AutoCompleteInput.ascx" %>

<div>
    <asp:UpdatePanel ID="updSubSites" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div id="page_subsites">
            <h1>
                <asp:Literal ID="litPageTitleSubSites" runat="server" Text="SubSites" /></h1>

            <asp:GridView CssClass="kartristable" ID="gvwSubSites" runat="server" AutoGenerateColumns="False"
                DataKeyNames="SUB_ID" GridLines="None" EnableViewState="true">
                <Columns>
                    <asp:BoundField DataField="SUB_ID" HeaderText='<%$ Resources:_Kartris, ContentText_ID%>'
                        ItemStyle-CssClass="idfield"></asp:BoundField>
                    <asp:TemplateField ItemStyle-CssClass="" HeaderText='Name'>
                        <ItemTemplate>
                            <asp:Literal ID="litNameValue" runat="server" Text='<%#Eval("SUB_Name") %>'> </asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="" HeaderText='Domain'>
                        <ItemTemplate>
                            <asp:Literal ID="litDomainValue" runat="server" Text='<%#Eval("SUB_Domain") %>'> </asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="" HeaderText='Base Category'>
                        <ItemTemplate>
                            <asp:Literal ID="litBaseCatIdValue" runat="server" Text='<%#Eval("CAT_Name") %>'> </asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="" HeaderText='Skin'>
                        <ItemTemplate>
                            <asp:Literal ID="litSkinValue" runat="server" Text='<%#Eval("SUB_Skin") %>'> </asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="" HeaderText='Notes'>
                        <ItemTemplate>
                            <asp:Literal ID="litNotesValue" runat="server" Text='<%#Eval("SUB_Notes") %>'> </asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="" HeaderText='Live'>
                        <ItemTemplate>
                            <asp:Literal ID="litLiveValue" runat="server" Text='<%#Eval("SUB_Live") %>'> </asp:Literal>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:TemplateField ItemStyle-CssClass="selectfield">
                        <ItemTemplate>
                            <a class="linkbutton icon_edit" href="_ModifySubSiteStatus.aspx?SubSiteID=<%#Eval("SUB_ID") %>">
                                <asp:Literal ID="litOLIndicates" runat="server" EnableViewState="false" Text="<%$ Resources:_Kartris, FormButton_Select %>"></asp:Literal></a>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField ItemStyle-CssClass="selectfield">
                                <HeaderTemplate>
                                    <asp:LinkButton ID="btnNew" runat="server" Text='<%$ Resources:_Kartris, FormButton_New %>'
                                        CommandName="CreateNewSubSite" CssClass="linkbutton icon_new floatright" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <a class="linkbutton icon_edit" href="_ModifySubSiteStatus.aspx?SubSiteID=<%#Eval("SUB_ID") %>">
                                        <asp:Literal ID="litOLIndicates" runat="server" EnableViewState="false" Text="<%$ Resources:_Kartris, FormButton_Select %>"></asp:Literal></a>
                                </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </div>

    <asp:UpdatePanel ID="updSubSite" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:PlaceHolder ID="phdupdSubSiteDetails" runat="server" Visible="false">
                        <div class="floatright">
                            <asp:LinkButton ID="lnkBtnBack" Cssclass="linkbutton icon_back" runat="server" OnClick="lnkBtnBack_Click"
                                                        Text='Back' /><br />
                        </div>
                        <div class="Kartris-DetailsView">
                            <div class="Kartris-DetailsView-Data">
                                <ul>
                                        <li><span class="Kartris-DetailsView-Name">
                                            <asp:Label ID="lblSubSiteName" runat="server" Text="Name"
                                                AssociatedControlID="txtSubSiteName" /></span> <span class="Kartris-DetailsView-Value">
                                                    <asp:TextBox runat="server" ID="txtSubSiteName" Text='<%# CkartrisDataManipulation.FixNullFromDB(Eval("SUB_Name"))%>' /></span>
                                            <asp:RequiredFieldValidator ID="RequiredSubSiteName" runat="server" CssClass="error"
                                                    ForeColor="" ErrorMessage="<%$ Resources: _Kartris, ContentText_RequiredField %>"
                                                    ControlToValidate="txtSubSiteName" ValidationGroup="SaveSubSite" Display="Dynamic" />
                                        </li>
                                        <li><span class="Kartris-DetailsView-Name">
                                            <asp:Label ID="lblSubSiteDomain" runat="server" Text="Domain"
                                                AssociatedControlID="txtSubSiteDomain" /></span> <span class="Kartris-DetailsView-Value">
                                                    <asp:TextBox runat="server" ID="txtSubSiteDomain" Text='<%# CkartrisDataManipulation.FixNullFromDB(Eval("SUB_Domain"))%>' /></span>
                                            <asp:RequiredFieldValidator ID="RequiredSubSiteDomain" runat="server" CssClass="error"
                                                    ForeColor="" ErrorMessage="<%$ Resources: _Kartris, ContentText_RequiredField %>"
                                                    ControlToValidate="txtSubSiteDomain" ValidationGroup="SaveSubSite" Display="Dynamic" />
                                        </li>
                                        <li><span class="Kartris-DetailsView-Name">
                                            <asp:Label ID="litContentTextCategoryParent" runat="server" Text="Category"></asp:Label>
                                        </span>
                                        <span class="Kartris-DetailsView-Value">
                                            <asp:UpdatePanel ID="updCategory" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:ListBox ID="lbxCategory" runat="server"></asp:ListBox>
                                                    <asp:LinkButton ID="lnkBtnRemoveCategory" Cssclass="linkbutton icon_delete" runat="server"
                                                        Text='<%$ Resources:_Kartris, ContentText_RemoveSelected %>' /><br />
                                                    <_user:AutoComplete ID="_UC_AutoComplete" runat="server" MethodName="GetCategories" />
                                                    <asp:LinkButton ID="lnkBtnAddCategory" Cssclass="linkbutton icon_new" runat="server"
                                                        Text='Select' /><br />
                                                    <asp:RequiredFieldValidator ID="RequiredCategory" runat="server" CssClass="error"
                                                    ForeColor="" ErrorMessage="<%$ Resources: _Kartris, ContentText_RequiredField %>"
                                                    ControlToValidate="lbxCategory" ValidationGroup="SaveSubSite" Display="Dynamic" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </span>
                                        </li>
                                        <li><span class="Kartris-DetailsView-Name">
                                            <asp:Label ID="lblSubSiteCatSkin" runat="server" Text="Skin"
                                                AssociatedControlID="ddlistTheme" /></span> <span class="Kartris-DetailsView-Value">
                                                    <%--<asp:TextBox ReadOnly="true" runat="server" ID="txtSubSiteSkin" Text='<%#Eval("SUB_Skin")%>' />--%>
                                                    <asp:DropDownList ID="ddlistTheme" runat="server" AutoPostBack="False">
                                                            <asp:ListItem Text="-" Value="" />   
                                                            </asp:DropDownList></span>
                                                            <asp:TextBox ID="txtTheme" runat="server" MaxLength="50" Visible="False" />
                                            <asp:RequiredFieldValidator ID="RequiredTheme" runat="server" CssClass="error"
                                                    ForeColor="" ErrorMessage="<%$ Resources: _Kartris, ContentText_RequiredField %>"
                                                    ControlToValidate="ddlistTheme" ValidationGroup="SaveSubSite" Display="Dynamic" />
                                        </li>
                                        <li><span class="Kartris-DetailsView-Name">
                                            <asp:Label ID="lblSubSiteNotes" runat="server" Text="Notes"
                                                AssociatedControlID="txtSubSiteNotes" /></span> <span class="Kartris-DetailsView-Value">
                                                    <asp:TextBox runat="server" ID="txtSubSiteNotes" TextMode="MultiLine" Text='<%# CkartrisDataManipulation.FixNullFromDB(Eval("SUB_Notes"))%>' /></span></li>
                                        <li><span class="Kartris-DetailsView-Name">
                                            <asp:Label ID="lblOrderStatus" runat="server" Text="Status" /></span>
                                                
                                            <span class="Kartris-DetailsView-Value"><span class="checkbox">
                                                <asp:CheckBox runat="server" ID="chkSubSiteLive" Checked='<%#Bind("SUB_Live")%>' /></span>
                                                <asp:Label CssClass="checkbox_label" ID="lblSubSiteLive" runat="server" Text="Live"
                                                    AssociatedControlID="chkSubSiteLive" /><asp:HiddenField runat="server" ID="hidOrigSubSiteLive"
                                                        Value='<%#Eval("SUB_Live")%>' />
                                                <br />
                                            </span></li>
                                    </ul>
                                </div>
                            </div>
                        <div id="updatebuttonbar" class="submitbuttons topsubmitbuttons">
                            <asp:LinkButton CausesValidation="True" CommandName="Add" CssClass="button savebutton" OnClick="lnkBtnAdd_Click"
                                runat="server" ID="lnkBtnAdd" Text="<%$ Resources: _Kartris, FormButton_Save %>"
                                ToolTip="<%$ Resources: _Kartris, FormButton_Save %>" />
                        </div>
                        </asp:PlaceHolder>
                    </ContentTemplate>
        </asp:UpdatePanel>

        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="spacer">
    </div>
    <asp:PlaceHolder ID="phdIndicates" runat="server">
        <div class="infomessage">
            <asp:Literal ID="litOLIndicates" runat="server" Text=""></asp:Literal>
            <asp:Literal ID="litOLIndicatesComplete" runat="server" Text=""></asp:Literal>
        </div>
    </asp:PlaceHolder>
    <_user:ItemPager runat="server" ID="_UC_ItemPager" />
    <_user:PopupMessage ID="_UC_PopupMsg" runat="server" />
</div>
