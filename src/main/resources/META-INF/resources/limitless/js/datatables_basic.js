/* ------------------------------------------------------------------------------
*
*  # Basic datatables
*
*  Specific JS code additions for datatable_basic.html page
*
*  Version: 1.0
*  Latest update: Aug 1, 2015
*
* ---------------------------------------------------------------------------- */
var table;
$(function() {


    // Table setup
    // ------------------------------

    // Setting datatable defaults
    $.extend( true,$.fn.dataTable.defaults, {
        autoWidth: false,
        columnDefs: [{  //此配置是禁止第六列的排序
            orderable: false,
            width: '100px',
            targets: [ 5 ]
        }],
        dom: '<"datatable-header"fl><"datatable-scroll"t><"datatable-footer"ip>',
        language: {
            search: '<span>Filter:</span> _INPUT_',
            lengthMenu: '<span>Show:</span> _MENU_',
            paginate: { 'first': 'First', 'last': 'Last', 'next': '&rarr;', 'previous': '&larr;' }
        },
        drawCallback: function () {
            $(this).find('tbody tr').slice(-3).find('.dropdown, .btn-group').addClass('dropup');
        },
        preDrawCallback: function() {
            $(this).find('tbody tr').slice(-3).find('.dropdown, .btn-group').removeClass('dropup');
        }
    });

    //data为对象数组
    var data=[
        {
            "":"",
            "First Name":"ffaf",
            "Last Name":"a",
            "Job Title":"b",
            "Status":"3124412",
            "DOB":"d",
            "Actions":"e"
        },
        {
            "":"",
            "First Name":"tom",
            "Last Name":"caf",
            "Job Title":"jso",
            "Status":"13444",
            "DOB":"dadf",
            "Actions":"afd"
        }
    ];

    //dataTable初始化
    table =$('.datatable-basic').DataTable({ //dataTable的Api
        "data":data,
        columnDefs:[
            {
                targets:[1],
                data:'First Name',
                title:"姓",
                bSearchable:false, //设置此列不可搜索,
                bSortable:false,  //设置此列不可排序
                render:function (data, type, row, meta) {
                     return "<a href='#' target='_blank'>" + data+ "</a>";
                }
            },
            {
                targets:[2],
                data:'Last Name',
                title:"名",
                render:function (data,type,row,meta) {
                    return "<a href='#'>"+data+"</a>";
                }
            },
            {
                targets:[3],
                title:"工作"
            },
            {
                targets:[4],
                title:"状态"
            }
        ],
        columns:[
            {data:''},
            {data:'First Name'},
            {data:'Last Name'},
            {data:'Job Title'},
            {data:'Status'},
            {data:'DOB'},
            {data:'Actions'}
        ]

    });

//生成行号
    table.on('order.dt search.dt',function() {   //on是监听，监听了order.dt search.dt两个事件，意思是排序搜索之后重新生成行号
                    table.column(0, {
                        search: 'applied',
                        order: 'applied'
                    }).nodes().each(function(cell, i) {
                        cell.innerHTML = i + 1;
                    });
                }).draw();

//设置鼠标经过行高亮
    var lastIdx = null;
    
    $('#datatable-basic tbody')
    .on( 'mouseover', 'tr', function () {
        //console.log(table);
         var rowIdx = table.row(this).index();
         if ( rowIdx !== lastIdx ) {
             $( table.rows().nodes() ).removeClass( 'highlight' );
             $( table.rows( rowIdx ).nodes() ).addClass( 'highlight' );
             //$( table.rows( rowIdx ).nodes() ).find(".sorting_1").removeClass( 'sorting_1' );
             //$( table.rows( rowIdx ).nodes() ).css("background-color","red");
         }
     } )
     .on( 'mouseleave', function () {
         $( table.rows().nodes() ).removeClass( 'highlight' );
     } );

    // Alternative pagination
    $('.datatable-pagination').DataTable({
        pagingType: "simple",
        columnDefs:[{
            bSortable:false,
            bSearchable:true
        }],
        language: {
            paginate: {'next': 'Next &rarr;', 'previous': '&larr; Prev'}
        }
    });


    // Datatable with saving state
    $('.datatable-save-state').DataTable({
        stateSave: true
    });


    // Scrollable datatable
    $('.datatable-scroll-y').DataTable({
        autoWidth: true,
        scrollY: 300
    });



    // External table additions
    // ------------------------------

    // Add placeholder to the datatable filter option
    $('.dataTables_filter input[type=search]').attr('placeholder','Type to filter...');
    //$('#DataTables_Table_0_length').attr('style','float:right');

    // Enable Select2 select for the length option
    $('.dataTables_length select').select2({
        minimumResultsForSearch: "-1"
    });
    
});
