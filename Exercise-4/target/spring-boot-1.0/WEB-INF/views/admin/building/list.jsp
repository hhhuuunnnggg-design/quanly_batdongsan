<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="formUrl" value="/api/user"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>

<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content" >
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check("breadcrumbs", "fixed");
                    } catch (e) {}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chu</a>
                    </li>
                    <li class="active">danh sách tòa nhà</li>
                </ul>
                <!-- /.breadcrumb -->

                <!-- /.nav-search -->
            </div>

            <div class="page-content">
                <!-- /.ace-settings-container -->
                <!-- /.page-header -->
                <div class="row">
                    <div class="col-xs-12">
                        <div class="widget-box ui-sortable-handle">
                            <div class="widget-header">
                                <h5 class="widget-title">Tìm kiếm .</h5>

                                <div class="widget-toolbar">
                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="widget-body" style=" font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif; ">
                                <div class="widget-main" >
<%--                                                         giúp dán kết quả lên input            api sẽ đẩy về--%>
                                    <form:form id="listForm" modelAttribute="modelSearch" action="${buildingListURL}" method="GET">
                                        <div class="row">
                                        <div class="form-group">
                                            <!-- phần 1 -->
                                            <div class="col-xs-12">
                                                <div class="row">
                                                    <div class="col-xs-6">
                                                        <div>
<%--                                                        Lưu ý mấy cái name trong này phải trùng với BuildingDTO--%>
                                                            <label class="name">Tên tòa nhà</label>
                                                                <form:input class="form-control" path="name" />
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6">
                                                        <div>
                                                            <label class="name">Diện tích sàn</label>
                                                            <form:input class="form-control" path="floorArea"/>

                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                            <!-- end phần 1 -->

                                            <!-- phần 2 -->
                                            <div class="col-xs-12">
                                                <div class="col-xs-2">
                                                    <div>
                                                        <label class="name">Quận hiện có</label>
                                                        <form:select type="text" class="form-control" path="district">
                                                            <form:option value="">---chọn quận</form:option>
                                                            <form:options items="${districts}"/>yy
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="col-xs-5">
                                                    <div>
                                                        <label class="name">Phường </label>
                                                        <form:input class="form-control" path="ward"/>
                                                    </div>

                                                </div>
                                                <div class="col-xs-5">
                                                    <div>
                                                        <label class="name">Đường</label>
                                                        <form:input class="form-control" path="street"/>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <label class="name">Số tầng hầm</label>
                                                    <form:input type="number" class="form-control" path="numberOfBasement"/>

                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Hướng </label>
                                                     <form:input type="text" class="form-control" path="direction"/>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Hang</label>
                                                     <form:input  type="text" class="form-control" path="level"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-3">
                                                    <label class="name">Diện tích từ</label>
                                                    <form:input  type="number" class="form-control" path="areaFrom"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Diện tích đến </label>
                                                    <form:input  type="number" class="form-control" path="areaTo"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Gía thuê từ</label>
                                                    <form:input  type="number" class="form-control" path="rentPriceFrom"/>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Gía thuê đến</label>
                                                    <form:input  type="number" class="form-control" path="rentPriceTo"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-5">
                                                    <label class="name">Tên quản lý</label>
                                                    <form:input  type="text" class="form-control" path="managerName"/>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">Điện thoại quản lý </label>
                                                    <form:input  type="number" class="form-control" path="managerPhone"/>
                                                </div>
                                                <div class="col-xs-2">
                                                    <label class="name"
                                                    >Chọn nhân viên phụ trách</label
                                                    >
                                                    <form:select type="text" class="form-control" path="staffId" >
                                                        <form:option value="">---chọn nhân viên---</form:option>
                                                        <form:options items="${listStaffs}"/>
                                                    </form:select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <form:checkboxes items="${typeCodes}" path="typeCode"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <div class="col-md-6">
                                                    <button class="btn btn-xs btn-danger" id="btnSearchBuilding">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                                                        </svg>
                                                        tìm kiếm
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                    </form:form>

                                </div>

                                 <!-- box -->
                                    <div class="pull-right">
                                        <a href="/admin/building-edit">
                                            <button class="btn btn-info" title="thêm tòa nhà ">thêm tòa nhà</button>
                                        </a>

                                        <button class="btn btn-danger" title="xóa tòa nhà!" id="btnDeleteBuilding">xóa tòa nhà</button>
                                    </div>
                                <!-- end box -->
                            </div>
                        </div>
                    </div>
                </div>

                <!-- bảng table -->
                <div class="row">
                    <div class="col-xs-12">
                        <table id="tableList" class="table table-striped table-bordered table-hover" >
                            <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" name="checkList" value="" />
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>tên tòa nhà</th>
                                <th>địa chỉ</th>
                                <th>Số tầng hầm</th>
                                <th>Tên quản lý</th>
                                <th>Số dt quản lý</th>
                                <th>Diện tích sàn</th>
                                <th>diện tích trống</th>
                                <th>diện tích thuê</th>
                                <th>phí mua giới</th>
                                <th>thao tác</th>
                            </tr>
                            </thead>
                            <tbody>

                           <c:forEach var="item" items="${buildingList}">
                                <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" name="checkList" value="${item.id}"/>
                                        <span class="lbl"></span>
                                    </label>
                                </td>

                                <td>${item.name}</td>
                                <td>${item.address}</td>
                                <td>${item.numberOfBasement}</td>
                                <td>${item.managerName}</td>
                                <td>${item.managerPhone}</td>
                                <td>${item.floorArea}</td>
                                <td>${item.rentarea}</td>
                                <td>${item.id}</td>
                                <td>${item.id}</td>
                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <button class="btn btn-xs btn-success" title="giao tòa nhà"
                                        onclick="assingmentBuilding(${item.id})"
                                        >
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="13" fill="currentColor" class="bi bi-house-add-fill" viewBox="0 0 16 16">
                                              <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 1 1-1 0v-1h-1a.5.5 0 1 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                              <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"/>
                                              <path d="m8 3.293 4.712 4.712A4.5 4.5 0 0 0 8.758 15H3.5A1.5 1.5 0 0 1 2 13.5V9.293z"/>
                                            </svg>
                                        </button>
<%--                                                                                                        đẩy dữ liệu lên param--%>
                                        <a class="btn btn-xs btn-info" title="sửa tòa nhà" href="/admin/building-edit-${item.id}">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>

                                        <button class="btn btn-xs btn-danger" title="xóa tòa nhà" onclick="deleteBuilding(${item.id})">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                    </div>
                                </td>
                                </tr>
                           </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <!-- /.span -->
                </div>
                <!-- end bảng table -->

                <!-- /.page-content -->
            </div>
        </div>
        <!-- /.main-content -->
</div>

<div class="modal fade" id="assingmentBuildingModel" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    &times;
                </button>
                <h4 class="modal-title">Danh sách nhân viên</h4>
            </div>
            <div class="modal-body">
                <table class="table table-striped table-bordered table-hover" id="stafflist">
                    <thead>
                    <tr>
                        <th class="center">chọn</th>
                        <th>tên Nhân viên</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <input type="hidden" id="buildingId" name="building" value="1" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-group-minier" id="btnassingmentBuilding" >Giao tòa nhà </button>
                <button type="button" class="btn btn-danger" id="btnclose"> Close</button>
            </div>
        </div>
    </div>
</div>

 <script>
      function assingmentBuilding(buildingId) {
        //   xuất giao diện ra maàn hình
        $("#assingmentBuildingModel").modal();
        // lấy giá trị
        $("#buildingId").val();
      }
      function loadStaff(buildingId){
          $.ajax({
          type: "Get",
          url: "${buildingAPI}/"+ buildingId/'staffs',
          data: JSON.stringify(data),
          // định nghĩa kiểu dữ liệu trả về là json
          contentType: "application/json",
          success: function (response) {
            console.log(response);
            var row=""
            $.each(response.data,function (index,item){
                row+='<tr>';
                    row+='<td class="text-center"><input type="checkbox"  value='+item.staffId + 'id="checkbox_"' +item.staffId +item.checked +'/></td>';
                    row+='<td class="text-center"/>'+item.fullName + '</td>';
                row+='</tr>';
            });
            $('#stafflist tbody').html(row);
            console.info("Da them  thanh cong")
          },
          error: function (response) {
            console.log(response);
            window.location.href= "<c:url value= "/admin/building-list?message=erro"/>";
            console.log("failed");
          },
       });
      }
      // giao tòa nhà
      $("#btnassingmentBuilding").click(function (e) {
        e.preventDefault();
        var data = {};
        data["buildingId"] = $("#buildingId").val();
        var staffs = $("#stafflist")
          //                     đã click vô rồi thì giữ
          .find("tbody input[type=checkbox]:checked")
          .map(function () {
            return $(this).val();
          })
          .get();
        data["staffs"] = staffs;
        console.log("ok");
      });

    //   chức năng tìm kiếm
    $("#btnSearchBuilding").click(function (e){
        // tránh trường hợp load nhầm
        e.preventDefault();
        $("#listForm").submit();
    })


    // chức năng xóa tòa nhà (xóa 1 thằng)
    function deleteBuilding(id){
        var buildingId=[id]
        deleteBuildings(buildingId);
    }
    // xóa nhiều thằng
    $("#btnDeleteBuilding").click(function (e) {
        e.preventDefault();
        var buildingids = $("#tableList")
                                  .find("tbody input[type=checkbox]:checked")
                                  .map(function () {
            return $(this).val();
          }).get();
        console.log("ok");
        deleteBuildings(buildingids);
      });


    function deleteBuildings(data){
       $.ajax({
          type: "Delete",
          url: "${buildingAPI}/"+ data,
          data: JSON.stringify(data),
          contentType: "application/json",
          success: function (response) {
            $("#h11").html("result");
            console.log(response);
            console.log("Succes");
          },
          error: function (response) {
            console.log(response);
            console.log("failed");
          },
       });
    }
 </script>
</body>
</html>
