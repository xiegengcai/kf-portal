<!DOCTYPE html>
<html lang="en">
<head>
    <title>Limitless - Responsive Web Application Kit by Eugene Kopyov</title>
    <#include "inc/meta.ftl"/>
    <#--在这里加入自定义js及样式文件-->
</head>
<body>
<!-- Main navbar -->
<#include "inc/navbar.ftl" />
<!-- /main navbar -->

<!-- Page container -->
<div class="page-container">
    <!-- Page content -->
    <div class="page-content">
        <!-- Main sidebar -->
        <#include "inc/sidebar.ftl"/>
        <!-- /main sidebar -->

        <!-- Main content -->
        <div class="content-wrapper">
            <!-- Page header -->
            <#include "inc/header.ftl" />
            <!-- /page header -->
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
                                <button type="button" class="btn  btn-primary btn-xs" data-toggle="modal" data-target="#modal_form_horizontal">增加</button>
                                <button type="button" class="btn  btn-info btn-xs" data-toggle="modal" data-target="#modal_form_horizontal">修改</button>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="panel panel-body">
                                <button type="button" class="btn  btn-primary btn-xs" data-toggle="modal" data-target="#modal_form_horizontal">批量导入</button>
                                <button type="button" class="btn  btn-success btn-xs" data-toggle="modal" data-target="#modal_form_horizontal">批量绑定</button>
                                <button type="button" class="btn  btn-success btn-xs" data-toggle="modal" data-target="#modal_form_horizontal">批量解绑</button>
                                <button type="button" class="btn  btn-warning btn-xs" id="sweet_combine" >批量删除</button>
                            </div>
                        </div>
                    </div>

                    <table class="table table-striped table-hover datatable-column-search-inputs" id="terminal_datatable">
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
            <#include "inc/footer.ftl"/>
            <!-- /content area -->
        </div>
        <!-- /main content -->
    </div>
    <!-- /page content -->
</div>
<!-- /page container -->

<!-- oper_tem -->
<script id="oper_tem" type="text/html">
    <ul class="icons-list">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="icon-menu9"></i>
            </a>

            <ul class="dropdown-menu dropdown-menu-right">
                <li><a href="###"  data-toggle="modal" data-target="#detail"><i class="icon-file-pdf"></i> 详情</a></li>
                <li><a href="###"  data-toggle="modal" data-target="#bind"><i class="icon-file-pdf"></i> 绑定</a></li>
                <li><a href="#"><i class="icon-file-pdf"></i> 解绑</a></li>
            </ul>
        </li>
    </ul>
</script>
<!-- /oper_tem -->
<!-- status_tem -->
<script id="status_tem" type="text/html">
    {{if status==0}}
    <span class="label bg-grey-400">下线</span>
    {{/if}}
    {{if status==1}}
    <span class="label bg-success">正常</span>
    {{/if}}
</script>
<!-- /status_tem -->

<!-- Add and update -->
<div id="modal_form_horizontal" class="modal fade">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h5 class="modal-title">终端</h5>
            </div>

            <form action="#" class="form-horizontal">
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-sm-3">序列号</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="sn12345678" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">版本</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="version.1.2.3.4" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3">Email</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="eugene@kopyov.com" class="form-control">
                            <span class="help-block">name@domain.com</span>
                        </div>
                    </div>

                </div>


                <div class="modal-footer">
                    <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /add and update -->


<!-- Detail -->
<div id="detail" class="modal fade">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h5 class="modal-title"></h5>
            </div>
            <div class="modal-body">
                <div class="panel panel-flat">
                    <div class="panel-body">
                        <div class="tabbable">
                            <ul class="nav nav-tabs nav-tabs-bottom nav-justified">
                                <li class="active"><a href="#justified-right-icon-tab1" data-toggle="tab">流量报表 <i class="icon-mention position-right"></i></a></li>
                                <li><a href="#justified-right-icon-tab2" data-toggle="tab">流量详细 <i class="icon-menu7 position-right"></i></a></li>
                                <li><a href="#justified-right-icon-tab3" data-toggle="tab">售后记录 <i class="icon-mention position-right"></i></a></li>
                                <li><a href="#justified-right-icon-tab4" data-toggle="tab">网络质量 <i class="icon-mention position-right"></i></a></li>
                                <li><a href="#justified-right-icon-tab5" data-toggle="tab">地图展示 <i class="icon-mention position-right"></i></a></li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane active" id="justified-right-icon-tab1">
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.

                                </div>

                                <div class="tab-pane" id="justified-right-icon-tab2">
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                </div>

                                <div class="tab-pane" id="justified-right-icon-tab3">
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.
                                    To use in tabs with equal widths add <code>.nav-justified</code> and icon markup to the tab nav.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                </div>

                                <div class="tab-pane" id="justified-right-icon-tab4">
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                </div>

                                <div class="tab-pane" id="justified-right-icon-tab5">
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                    Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid laeggin.
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- /detail -->


<!-- Bind -->
<div id="bind" class="modal fade">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h5 class="modal-title"></h5>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- /bind -->
</body>

</html>
