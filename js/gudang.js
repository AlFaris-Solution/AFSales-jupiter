var table;
var tableLov = null;
var dropify;

function chooseArtikel(event, id, articleId, newArticleId, kategori, note) {
    $("#articleId").val(id);
    $("#nama").val(nama);
    $("#lbl_nama").val(nama);
    $("#nama_kelompok_pendidikan").val(pendidikan);
    $("#lbl_nama_kelompok_pendidikan").val(pendidikan);
    $("#kode_kelas_pendidikan").val(kelas);
    $("#lbl_kode_kelas_pendidikan").val(kelas);
    $("#nama_program").val(program);
    $("#lbl_nama_program").val(program);
    $("#articleId").trigger("input");
    $("#myModal").modal("hide");
    event.preventDefault();
}

var validation = (function() {
    
    var init = function() {
        _applyValidation();
    };
    
    var _applyValidation = function() {
        
        $('#frmData').formValidation({
            framework: "bootstrap",
            button: {
              selector: '#btnSubmit',
              disabled: 'disabled'
            },
            icon: null,
            fields: {
              kodeKate: {
                validators: {
                  notEmpty: {
                   message: 'Kode Kategori harus diisi'
                  },
                  stringLength: {
                    max: 3,
                    message: 'Nama tidak boleh lebih dari 40 karakter'
                  }
                }
              }
            }
        });
    
    };
    
    return {
        init: init
    };
    
})();

var confirmDelete = function(event, id, nama) {
    event.preventDefault();
    
    swal({
        title: "Apakah anda yakin?",
        text: "Data agama dengan nama " + nama + " akan dihapus!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Ya, lanjutkan!",
        cancelButtonText: "Tidak, batalkan!",
        closeOnConfirm: false,
        showLoaderOnConfirm: true,
    },
    function() {
        $.ajax({
            beforeSend: function(xhr) { xhr.setRequestHeader("X-CSRF-Token", $("meta[name='csrf_token']").attr("content")); },
            type: "POST",
            url: "/kategori/delete/" + id
        })
        .done(function(data) {
            if (data == "success") {
                // Redraw table
                table.draw();
                swal("", "Data berhasil dihapus.", "success");    
            }
            else {
                swal("", data, "error"); 
            }
        });
    });
    
};

var datatables = (function() {

    var datatablesURL = 'gudang/list';

    var init = function() {
        _applyDatatable();
    };

    var _applyDatatable = function() {

        table = $('#list').DataTable({
            'processing': true,
            'serverSide': true,
            'paging': true,
            //'lengthChange': false,
            //'searching': false,
            'ordering': true,
            'info': true,
            'autoWidth': false,
            'ajax': {
                "url": datatablesURL,
                "data": function (d) {
                    d.id = $('#id').val();
                    d.kode_kontak = $('#kode_gudang').val();
                    d.nama_kontak = $('#nama_gudang').val();
                    /*
                    d.nama_kelompok_pendidikan = $('#nama_kelompok_pendidikan option:selected').val();
                    d.nama_program = $('#nama_program option:selected').val();
                    d.kode_biaya_syahriah = $('#kode_biaya_syahriah option:selected').val();
                    d.kode_biaya_infaq = $('#kode_biaya_infaq option:selected').val();
                    d.kode_biaya_kesekretariatan = $('#kode_biaya_kesekretariatan option:selected').val();
                    d.status_santri = $('#status_santri option:selected').val();
                    */
                }
                //"type": "POST"
            },
            'columns': [
                {data: 'kode_gudang', name: 'kode_gudang'},
                {data: 'nama_gudang', name: 'nama_gudang'},
                {data: 'is_container', name: 'is_container', className: 'text-center'},
                {data: 'is_active', name: 'is_active', className: 'text-center'},
                {data: 'kategori_gudang', name: 'kategori_gudang', className: 'text-center'},
                {data: 'action', name: 'action', orderable: false, searchable: false, className: 'text-center'}
            ]
        });
        
    };
    
    return {
        init: init
    };

})();
