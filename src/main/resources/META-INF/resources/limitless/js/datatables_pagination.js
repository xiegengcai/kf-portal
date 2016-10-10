
var table;
$(function(){

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
        dom: '<"datatable-header"fl><"datatable-scroll"t><"datatable-footer"pi>',
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


    var data = [
    	[
    		"","first","lastName","Jop","af","2019","Actions"
    	],
    	[
    		"","adsave","bound","Jso","fas","2012","actione"
    	]
    ];

    // Alternative pagination
    table = $('.datatable-pagination').DataTable({
        pagingType: "simple",
        data:data,
        columnDefs:[{
            bSortable:false,
            bSearchable:true
        }],
        language: {
            paginate: {'next': 'Next &rarr;', 'previous': '&larr; Prev'}
        }
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
    
    $('#datatable-pagination tbody')
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