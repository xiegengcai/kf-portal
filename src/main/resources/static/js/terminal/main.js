/**
 * Created by Xie Gengcai on 2016/10/9.
 */
$(function () {
    $('#terminal_datatable').DataTable({
        serverSide: true,
        ajax: bp + "/terminal/getAll",
        columns: [
            {"data": "sn"},
            {"data": "mac"},
            {"data": "flashId"},
            {"data": "version"},
            {"data": "status","render":function (data, type, full, meta) {
                return template("status_tem",full);
            }},
            {"type":"date","data": "createTime"},
            {"type":"date","data": "updateTime"},
            {"render":function (data, type, full, meta) {
                return template("oper_tem");
            }
            }
        ]
    });
})
