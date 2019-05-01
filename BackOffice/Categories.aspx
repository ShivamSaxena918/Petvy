<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        function CategoryVerification() {
            alert("Category Name Is Alreday Use");
            document.getElementById("txtCategoryName").onfocus = true;
        }
    </script>
    <script>
        function validate() {
            var name = document.getElementById("<%=txtCategoryName.ClientID%>").value.trim();
            if (name == "") {

            Materialize.toast('Category Name cannot be blank', 4000)
            document.getElementById("<%=txtCategoryName.ClientID%>").focus();
                return false;
            }
            var letters = /^[A-Za-z ]+$/;
            if (document.getElementById("<%=txtCategoryName.ClientID%>").value.match(letters)) {

                    }
                    else {
                        Materialize.toast('Category Name Can Only Be Alphabet', 4000)
                        return false;
                    }
                    if (document.getElementById("<%=txtdesc.ClientID%>").value == "") {

            Materialize.toast('Description cannot be blank', 4000)
            document.getElementById("<%=txtCategoryName.ClientID%>").focus();
                return false;
            }

            return true;
        }
    </script>
    <!-- START TABLE FORMAT -->
    <div class="card-panel">
        <div class="row">
            <div class="col s12">
                <h4 class="header1">Categories</h4>
            </div>
            <div class="col s6">
                <%--<button class="btn" data-toggle="collapse" data-target="#demo" type="button" style="margin-left: 390px; margin-top: 17px"><i class="material-icons" style="font-size: 42px;">person_add</i></button>--%>
                <%--<!-- Modal Trigger -->
                <a class="modal-trigger" href="#modal1" style="color: crimson">
                    <i class="material-icons right" style="font-size: 50px; margin-top: 15px; margin-left: 0px;">pets</i>
                    <i class="material-icons right" style="font-size: 50px; margin-top: 15px; margin-right: 0px">add</i>
                </a>
                <!-- Modal Trigger End-->--%>
            </div>
        </div>
        <asp:Panel ID="Panel1" runat="server">
            <div class="row">
                <div class="col offset-l3 l6">
                    <input id="txtCategoryName" type="text" style="width: 100%" runat="server" placeholder="Category Type">
                </div>
            </div>
            <div class="row">
                <div class="col offset-l3 l6">
                    <input id="txtdesc" type="text" style="width: 100%" runat="server" placeholder="Category Description">
                </div>
            </div>
            <div class="row">
                <div class="col offset-l3 l6">
                    <asp:DropDownList ID="ddCategoriesName" runat="server" AutoPostBack="false"></asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <asp:Button ID="btnadd" CssClass="waves-effect waves-light btn gradient-45deg-light-blue-cyan z-depth-4 mr-1 right" runat="server" Text="ADD" OnClick="btnadd_Click" OnClientClick="return validate()" />
                </div>
            </div>
        </asp:Panel>
        <!-- START CONTENT -->
        <div class="section">
            <div class="divider"></div>
            <div id="table-datatables">
                <div class="row">
                    <div class="col s12">
                        <table id="data-table-simple" class="responsive-table" cellspacing="0">
                            <thead>
                                <tr>
                                    <th class="center">Name</th>
                                    <th class="center">Desc</th>
                                    <th class="center">IsActive</th>
                                    <th class="center">ParentCategoryName</th>

                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptcategory" runat="server" OnItemCommand="rptcategory_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="center"><%# Eval("Name") %></td>
                                            <td class="center"><%# Eval("Desc") %></td>
                                            <td class="icon-preview center">
                                                <asp:HiddenField ID="HId" runat="server" Value='<%# Eval("CategoryId")%>' />
                                                <asp:LinkButton ID="isactive" runat="server" CommandName="active" CommandArgument='<%# Eval("CategoryId") %>'>
                                                    <b><i class="material-icons" style="color: lawngreen; font-weight: bolder;">
                                                        <asp:Label ID="lblactive" runat="server"></asp:Label></i></b>
                                                </asp:LinkButton>
                                            </td>
                                            <td class="center"><%# Eval("CategorytypeName") %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--DataTables example Row grouping-->
        </div>
        <!-- END CONTENT -->
    </div>


    <%-- <ul class="collapsible" data-collapsible="accordion">

        <li class="bold">
            <a class="collapsible-header  waves-effect waves-cyan">
                <i class="material-icons" style="font-size: 40px">touch_app</i>
                <span style="font-size: 20px">Categories</span>
                <i class="material-icons modal-trigger " style="margin-left: 500px; font-size: 50px" href="#modal1">add</i>
            </a>
            <div class="collapsible-body">
                <ul class="collapsible" data-collapsible="accordion">
                    <li class="bold">
                        <a class="collapsible-header  waves-effect waves-cyan">
                            <i class="material-icons">keyboard_arrow_right</i>
                            <span>Accessories</span>
                        </a>
                        <div class="collapsible-body">
                            <ul class="collapsible" data-collapsible="accordion">   
                                <li class="bold">
                                    <a class="waves-effect waves-cyan">
                                        <p>
                                            <input type="checkbox" id="test5" />
                                            <label for="test5">Collars</label>
                                        </p>

                                    </a>
                                </li>
                                <li class="bold">
                                    <a class="waves-effect waves-cyan">
                                        <p>
                                            <input type="checkbox" id="Checkbox1" />
                                            <label for="Checkbox1">Bowls</label>
                                        </p>

                                    </a>
                                </li>
                                <li class="bold">
                                    <a class="waves-effect waves-cyan">
                                        <p>
                                            <input type="checkbox" id="Checkbox2" />
                                            <label for="Checkbox2">Beds</label>
                                        </p>

                                    </a>
                                </li>
                                <li class="bold">
                                    <a class="waves-effect waves-cyan">
                                        <p>
                                            <input type="checkbox" id="Checkbox4" />
                                            <label for="Checkbox4">Cage</label>
                                        </p>

                                    </a>
                                </li>
                                <li class="bold">
                                    <a class="waves-effect waves-cyan">
                                        <p>
                                            <input type="checkbox" id="Checkbox3" />
                                            <label for="Checkbox3">Grooming Equipment</label>
                                        </p>

                                    </a>

                                </li>



                                <a class=" modal-action modal-close waves-effect waves-light btn gradient-45deg-red-pink z-depth-4 mr-1 right " style="margin-top: 8px">SUBMIT</a>

                            </ul>
                        </div>
                    </li>
                    <li class="bold">
                        <a class="collapsible-header  waves-effect waves-cyan">
                            <i class="material-icons">keyboard_arrow_right</i>
                            <span>Food</span>
                        </a>
                    </li>
                </ul>
            </div>
        </li>
    </ul>
    <!-- Modal Structure 1 -->
    <div id="modal1" class="modal">
        <div class="modal-content">

                <div class="row">

                    <div class="input-field col s8">
                        <i class="material-icons prefix">add_box</i>
                        <input id="txtCategoryName" type="text" runat="server">
                        <label for="txtCategoryName">Add Categories Name</label>
                    </div>

                </div>
                <div class="row">
                    <div class="input-field col s8">
                        <i class="material-icons prefix">view_list</i>
                        <asp:DropDownList ID="ddCategoriesName" runat="server" placeholder="Categories Name" AutoPostBack="true" OnSelectedIndexChanged="ddCategoriesName_SelectedIndexChanged"></asp:DropDownList>

                    </div>
                </div>



                <div class="row">
                    <div class="input-field col s6">
                        <asp:Button ID="Submit" class="waves-light btn gradient-45deg-red-pink z-depth-4 mr-1 right" Style="margin-left: 100px" runat="server" Text="SUBMIT" OnClick="Submit_Click" />
                        
                    </div>
                </div>
        </div>
    </div>
    <!-- Modal Structure End 1 -->--%>
</asp:Content>

