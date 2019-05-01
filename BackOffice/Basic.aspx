<%@ Page Title="" Language="C#" MasterPageFile="MainMasterPage.master" AutoEventWireup="true" CodeFile="Basic.aspx.cs" Inherits="AdminDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <!-- START CONTENT -->
            <div class="section">
              <div class="divider"></div>
              <div id="table-datatables">
                <div class="row">
                    
                  <div class="col s12">
                    <table id="data-table-simple" class="responsive-table display" cellspacing="0">
                      <thead>
                        <tr>
                          <th>Name</th>
                          <th>Position</th>
                          <th>Office</th>
                          <th>Start date</th>
                          <th>IsActive</th>
                            <th>Action</th>
                        </tr>
                      </thead>
                    
                      <tbody>
                        <tr>
                          <td>Tiger Nixon</td>
                          <td>System Architect</td>
                          <td>Edinburgh</td>
                          <td>2011/04/25</td>
                          <td class="icon-preview"><i class="material-icons" style="margin-left:30px"><a style="color:lawngreen" href="">check</a></i></td>
                          <td class="icon-preview">
                              <a style="color:black" href=" ">
                              <i class="material-icons" style="margin-left:5px;color:gold">create</i>
                              <i class="material-icons" style="color:red">delete_forever</i>
                              </a>
                          </td>
                        </tr>
                        <tr>
                          <td>Garrett Winters</td>
                          <td>Accountant</td>
                          <td>Tokyo</td>
                          <td>2011/07/25</td>
                         <td class="icon-preview"><i class="material-icons" style="margin-left:30px"><a style="color:lawngreen" href="">check</a></i></td>
                          <td class="icon-preview">
                              <a style="color:black" href=" ">
                              <i class="material-icons" style="margin-left:5px;color:gold">create</i>
                              <i class="material-icons" style="color:red">delete_forever</i>
                              </a>
                          </td>
                        </tr>
                        <tr>
                          <td>Ashton Cox</td>
                          <td>Junior Technical Author</td>
                          <td>San Francisco</td>
                          <td>2009/01/12</td>
                         <td class="icon-preview"><i class="material-icons" style="margin-left:30px"><a style="color:lawngreen" href="">check</a></i></td>
                           <td class="icon-preview">
                              <a style="color:black" href=" ">
                              <i class="material-icons" style="margin-left:5px;color:gold">create</i>
                              <i class="material-icons" style="color:red">delete_forever</i>
                              </a>
                          </td>
                        </tr>
                        <tr>
                          <td>Cedric Kelly</td>
                          <td>Senior Javascript Developer</td>
                          <td>Edinburgh</td>
                          <td>2012/03/29</td>
                          <td class="icon-preview"><i class="material-icons" style="margin-left:30px"><a style="color:lawngreen" href="">check</a></i></td>
                          <td class="icon-preview">
                              <a style="color:black" href=" ">
                              <i class="material-icons" style="margin-left:5px;color:gold">create</i>
                              <i class="material-icons" style="color:red">delete_forever</i>
                              </a>
                          </td>
                        </tr>
                        <tr>
                          <td>Airi Satou</td>
                          <td>Accountant</td>
                          <td>Tokyo</td>
                          <td>2008/11/28</td>
                         <td class="icon-preview"><i class="material-icons" style="margin-left:30px"><a style="color:lawngreen" href="">check</a></i></td>
                          <td class="icon-preview">
                              <a style="color:black" href=" ">
                              <i class="material-icons" style="margin-left:5px;color:gold" >create</i>
                              <i class="material-icons"style="color:red">delete_forever</i>
                              </a>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <br>
             
              <!--DataTables example Row grouping-->
            </div>
        <!-- END CONTENT -->
</asp:Content>

