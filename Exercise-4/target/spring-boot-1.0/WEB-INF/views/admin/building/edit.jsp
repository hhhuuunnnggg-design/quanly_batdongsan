
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="formUrl" value="/api/user"/>
<c:url var="buildingAPI" value="/api/building"/>
<c:url var="addBuildingListURL" value="/admin/building-edit"/>

<html>
<head>
    <title>Thêm tòa nhà</title>
</head>
<body>
   <div class="main-content" id="main-container">
      <div class="main-content">
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
                <a href="#">Home</a>
              </li>
              <li class="active">Dashboard</li>
            </ul>
            <!-- /.breadcrumb -->

            <div class="nav-search" id="nav-search">
              <form class="form-search">
                <span class="input-icon">
                  <input
                    type="text"
                    placeholder="Search ..."
                    class="nav-search-input"
                    id="nav-search-input"
                    autocomplete="off"
                  />
                  <i class="ace-icon fa fa-search nav-search-icon"></i>
                </span>
              </form>
            </div>
            <!-- /.nav-search -->
          </div>

          <div class="page-content">
            <div class="ace-settings-container" id="ace-settings-container">
              <div
                class="btn btn-app btn-xs btn-warning ace-settings-btn"
                id="ace-settings-btn"
              >
                <i class="ace-icon fa fa-cog bigger-130"></i>
              </div>

              <div class="ace-settings-box clearfix" id="ace-settings-box">
                <div class="pull-left width-50">
                  <div class="ace-settings-item">
                    <div class="pull-left">
                      <select id="skin-colorpicker" class="hide">
                        <option data-skin="no-skin" value="#438EB9">
                          #438EB9
                        </option>
                        <option data-skin="skin-1" value="#222A2D">
                          #222A2D
                        </option>
                        <option data-skin="skin-2" value="#C6487E">
                          #C6487E
                        </option>
                        <option data-skin="skin-3" value="#D0D0D0">
                          #D0D0D0
                        </option>
                      </select>
                    </div>
                    <span>&nbsp; Choose Skin</span>
                  </div>

                  <div class="ace-settings-item">
                    <input
                      type="checkbox"
                      class="ace ace-checkbox-2"
                      id="ace-settings-navbar"
                    />
                    <label class="lbl" for="ace-settings-navbar">
                      Fixed Navbar</label
                    >
                  </div>

                  <div class="ace-settings-item">
                    <input
                      type="checkbox"
                      class="ace ace-checkbox-2"
                      id="ace-settings-sidebar"
                    />
                    <label class="lbl" for="ace-settings-sidebar">
                      Fixed Sidebar</label
                    >
                  </div>

                  <div class="ace-settings-item">
                    <input
                      type="checkbox"
                      class="ace ace-checkbox-2"
                      id="ace-settings-breadcrumbs"
                    />
                    <label class="lbl" for="ace-settings-breadcrumbs">
                      Fixed Breadcrumbs</label
                    >
                  </div>

                  <div class="ace-settings-item">
                    <input
                      type="checkbox"
                      class="ace ace-checkbox-2"
                      id="ace-settings-rtl"
                    />
                    <label class="lbl" for="ace-settings-rtl">
                      Right To Left (rtl)</label
                    >
                  </div>

                  <div class="ace-settings-item">
                    <input
                      type="checkbox"
                      class="ace ace-checkbox-2"
                      id="ace-settings-add-container"
                    />
                    <label class="lbl" for="ace-settings-add-container">
                      Inside
                      <b>.container</b>
                    </label>
                  </div>
                </div>
                <!-- /.pull-left -->

                <div class="pull-left width-50">
                  <div class="ace-settings-item">
                    <input
                      type="checkbox"
                      class="ace ace-checkbox-2"
                      id="ace-settings-hover"
                    />
                    <label class="lbl" for="ace-settings-hover">
                      Submenu on Hover</label
                    >
                  </div>

                  <div class="ace-settings-item">
                    <input
                      type="checkbox"
                      class="ace ace-checkbox-2"
                      id="ace-settings-compact"
                    />
                    <label class="lbl" for="ace-settings-compact">
                      Compact Sidebar</label
                    >
                  </div>

                  <div class="ace-settings-item">
                    <input
                      type="checkbox"
                      class="ace ace-checkbox-2"
                      id="ace-settings-highlight"
                    />
                    <label class="lbl" for="ace-settings-highlight">
                      Alt. Active Item</label
                    >
                  </div>
                </div>
                <!-- /.pull-left -->
              </div>
              <!-- /.ace-settings-box -->
            </div>
            <!-- /.ace-settings-container -->

            <div class="page-header">
              <h1>
                Dashboard 1
                <small>
                  <i class="ace-icon fa fa-angle-double-right"></i>
                  overview &amp; stats
                </small>
              </h1>
            </div>
            <!-- /.page-header -->
            <style>
              .form-group .col-xs-12 {
                margin-bottom: 15px; /* Điều chỉnh khoảng cách tùy ý */
              }
            </style>
            <div class="row">
              <form id="form-edit" role="form">
                <!-- Các thẻ div của form -->
                <form:form modelAttribute="buildingEdit" method="GET" id="ListForm"  action="${addBuildingListURL}">
                  <div class="row">
                  <div class="form-group">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3">
                          <label class="name">Tên tòa nhà</label>
                        </div>
                        <div class="col-xs-6">
                          <form:input class="form-control" path="name" value=""/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3">
                          <label class="name">Quận</label>
                        </div>
                        <div class="col-xs-6">
                          <form:select type="text" class="form-control" path="district">
                              <form:option value="">---chọn quận</form:option>
                              <form:options items="${districts}"/>yy
                          </form:select>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3">
                          <label class="name">Phường</label>
                        </div>
                        <div class="col-xs-6">
                          <form:input class="form-control" path="ward" value=""/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3">
                          <label class="name">Đường</label>
                        </div>
                        <div class="col-xs-6">
                          <form:input class="form-control" path="street" value=""/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3">
                          <label class="name">Kết cấu</label>
                        </div>
                        <div class="col-xs-6">
                          <input type="text" class="form-control" name="textture" value=""/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3">
                          <label class="name">Số tầng hầm</label>
                        </div>
                        <div class="col-xs-6">
                          <form:input class="form-control" path="numberOfBasement" value=""/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3">
                          <label class="name">Diện tích sàn</label>
                        </div>
                        <div class="col-xs-6">
                          <form:input class="form-control" path="floorArea" value=""/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3">
                          <label class="name">Hướng</label>
                        </div>
                        <div class="col-xs-6">
                         <form:input class="form-control" path="direction" value=""/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3">
                          <label class="name">Hạng</label>
                        </div>
                        <div class="col-xs-6">
                          <form:input class="form-control" path="level" value=""/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3">
                          <label class="name">Diện tích thuê</label>
                        </div>
                        <div class="col-xs-6">
                          <form:input class="form-control" path="rentArea" value=""/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3">
                          <label class="name">Gía thuê</label>
                        </div>
                        <div class="col-xs-6">
                          <form:input type="text" class="form-control" path="rentPrice" value=""/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3">
                          <label class="name">Mô tả giá</label>
                        </div>
                        <div class="col-xs-6">
                          <input type="text" class="form-control" name="price_description" value=""/>
                        </div>
                      </div>
                    </div>
                  </div>

<%--                  --%>
                  <div class="form-group">
                        <!-- Các input khác -->
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3">
                          <label class="name">Loại tòa nhà</label>
                        </div>
                        <div class="col-xs-9">
                           <form:checkboxes items="${typeCodes}" path="typeCode"/>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="form-group">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="col-xs-3"></div>
                        <div class="col-xs-9">
                          <c:if test="${not empty buildingEdit.id}">
                            <button  type="button" class="btn btn-primary"  id="btnAddOrUpdateBuilding">Cập nhật tòa nhà</button>
                            <button type="button" class="btn btn-primary" id="btnCancel" title="Hủy tòa nhà">Hủy tòa nhà</button>
                          </c:if>

                          <c:if test="${empty buildingEdit.id}">
                            <button  type="button" class="btn btn-primary"  id="btnAddOrUpdateBuilding">Thêm tòa nhà mới</button>
                            <button type="button" class="btn btn-primary" id="btnCancel" title="Hủy tòa nhà">Hủy tòa nhà</button>
                          </c:if>
                        </div>
                      </div>
                    </div>
                  </div>
                  <form:hidden path="id" id="buildingId"/>
                </div>
                </form:form>

              </form>
            </div>
            <!-- /.row -->
          </div>
          <!-- /.page-content -->
        </div>
      </div>
      <!-- /.main-content -->
    </div>

<%--Các chức năng thì sẽ ở đây--%>
   <script>
<%--    thêm hoặc sửa tòa nhà--%>
      $("#btnAddOrUpdateBuilding").click(function (event) {
        event.preventDefault(); // Ngăn form tự động submit
        var data = {};
        var typeCode = [];
        var formData = $("#form-edit").serializeArray();

        $.each(formData, function (i, v) {
          if (v.name != "typeCode") {
            data[v.name] = v.value;
          } else {
            typeCode.push(v.value);
          }
        });
        data["typeCode"] = typeCode;
        if(typeCode!=""){
          addOrUpdateBuilding(data);
        }
        else {
          window.location.href= "<c:url value= "/admin/building-edit?typeCode=require"/>";
        }
      });
      function addOrUpdateBuilding(data){
        // call api
        $.ajax({
          type: "POST",
          url: "${buildingAPI}",
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

    // chức năng hủy tòa nhà
    $('#btnCancel').click(function (e){
      e.preventDefault();
      // hien thị trên
      window.location.href="/admin/building-list";

    });


    </script>

</body>
</html>


