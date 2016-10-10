<!DOCTYPE html>
<html lang="en">
<head>
    <#include "../inc/meta.ftl"/>
    <#--在这里加入自定义js及样式文件-->
</head>
<body>
<#include "../inc/header.ftl" />
<!-- Page container -->
<div class="page-container">
    <!-- Page content -->
    <div class="page-content">
    <#include "../inc/sidebar.ftl"/>
        <!-- Main content -->
        <div class="content-wrapper">
            <div class="page-header">
                <div class="breadcrumb-line">
                    <ul class="breadcrumb ">
                        <li><a href="${ctx}/"><i class="icon-home2 position-left"></i> Home</a></li>
                        <li class="active">Terminal</li>
                    </ul>
                </div>
            </div>
            <!-- Content area -->
            <div class="content">
                <!-- Page length options -->
                <div class="panel panel-flat">
                    <div class="panel-heading">
                        <div class="heading-elements">
                            <ul class="icons-list">
                                <li><a data-action="collapse"></a></li>
                                <li><a data-action="reload"></a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="panel-body"></div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="panel panel-body">
                                <button type="button" class="btn  btn-primary btn-xs" data-toggle="modal"
                                        data-target="#modal_form_horizontal">增加
                                </button>
                                <button type="button" class="btn  btn-info btn-xs" data-toggle="modal"
                                        data-target="#modal_form_horizontal">修改
                                </button>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-body">
                                <button type="button" class="btn  btn-primary btn-xs" data-toggle="modal"
                                        data-target="#modal_form_horizontal">批量导入
                                </button>
                                <button type="button" class="btn  btn-success btn-xs" data-toggle="modal"
                                        data-target="#modal_form_horizontal">批量绑定
                                </button>
                                <button type="button" class="btn  btn-success btn-xs" data-toggle="modal"
                                        data-target="#modal_form_horizontal">批量解绑
                                </button>
                                <button type="button" class="btn  btn-warning btn-xs" id="sweet_combine">批量删除</button>
                            </div>
                        </div>
                    </div>

                    <table class="table table-striped table-hover datatable-column-search-inputs"
                           id="terminal_datatable">
                        <thead>
                        <tr>
                            <th>序列号</th>
                            <th>mac</th>
                            <th>固件ID</th>
                            <th>版本</th>
                            <th>状态</th>
                            <th>创建时间</th>
                            <th>更新时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <!--<tfoot>
                            <tr>
                                <td>序列号</td>
                                <td>mac</td>
                                <td>flashId</td>
                                <td>固件版本</td>
                                <td>状态</td>
                                <td>创建时间</td>
                                <td>更新时间</td>
                            </tr>
                        </tfoot>-->
                    </table>
                </div>
                <!-- /page length options -->
            </div>
            <#include "../inc/footer.ftl"/>
            <!-- /content area -->
        </div>
        <!-- /main content -->
    </div>
    <!-- /page content -->
</div>
<!-- /page container -->
</body>

</html>
