    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/3.0.5/daterangepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.5.0/jszip.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.6.2/js/buttons.html5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.nicescroll/3.7.6/jquery.nicescroll.min.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="{{ asset('bower_components/gentelella/build/js/custom.min.js') }}"></script>
    
    <script type="text/javascript">
        $.extend(true, $.fn.dataTable.defaults, {
            "autoWidth" : false,
            "language": {
                "emptyTable": "Tidak ada data di dalam tabel",
                "info": "Menampilkan _START_ sampai _END_ dari _TOTAL_ antrian",
                "infoEmpty": "Menampilkan 0 sampai 0 dari 0 antrian",
                "infoFiltered": "(difilter dari _MAX_ total antrian)",
                "lengthMenu": "Tampilkan _MENU_ antrian",
                "loadingRecords": "Loading...",
                "processing": "Processing...",
                "search": "Cari:",
                "zeroRecords": "Tidak ada baris yang cocok",
                "paginate": {
                    "previous": "Sebelumnya",
                    "next": "Berikutnya",
                    "first": "&laquo;",
                    "last": "&raquo;"
                }
            }
        });
        $('table[data-form="deleteForm"]').on('click', '.form-delete', function(e){
            e.preventDefault();
            var $form = $(this);
            $('#confirm').modal({ backdrop: 'static', keyboard: false })
                .on('click', '#delete-btn', function(){
                    $form.submit();
                });
        });
        $('.right_col').css('min-height', '900px');

        var elem = document.querySelector("body");

        /* Function to open fullscreen mode */
        function openFullscreen() {
            if (elem.requestFullscreen) elem.requestFullscreen();
            else if (elem.mozRequestFullScreen) elem.mozRequestFullScreen(); /* Firefox */
            else if (elem.webkitRequestFullscreen) elem.webkitRequestFullscreen(); /* Chrome, Safari & Opera */
            else if (elem.msRequestFullscreen) elem.msRequestFullscreen(); /* IE/Edge */
        }

        $(".left_col").niceScroll({
            cursorwidth: "6px",
            cursorcolor: '#ddd',
            background: "#f5f5f5",
        });
        $('.table-responsive .table').css('overflowY', 'hidden')
    </script>

    @stack('javascripts')
    @yield('javascript')
    @yield('script')