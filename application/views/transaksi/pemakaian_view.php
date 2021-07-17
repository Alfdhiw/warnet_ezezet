<script src="<?php echo base_url() ?>assets/vendors/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
    $(function() {
        $("#slcAgta").change(function() {
            var agt = $(this).val();
            $.ajax({
                url: "<?php echo base_url() ?>pemakaian/searchAgtName",
                type: "POST",
                data: {
                    "id": agt
                },
                cache: false,
                success: function(huh) {
                    $("#tbNama").val(huh);
                }
            })
        })
        //Buku 1
        $("#slcBookCode1").change(function() {
            if (this.value != '') {
                $('#row2').css('display', 'block');
                //Get Data
                $.ajax({
                    url: "<?php echo base_url() ?>pemakaian/searchBookTitle",
                    type: "POST",
                    data: "id=" + this.value,
                    cache: false,
                    success: function(data) {
                        $("#tbJudul1").val(data);
                    }
                })
            }
            if (this.value == '') {
                $('#tbJudul1').val('');

                $('#row2').css('display', 'none');
                $('#slcBookCode2').prop('selectedIndex', 0);
                $('#tbJudul2').val('');
                //3
                $('#row3').css('display', 'none');
                $('#slcBookCode3').prop('selectedIndex', 0);
                $('#tbJudul3').val('');
            }
        })
        //Buku 2
        $("#slcBookCode2").change(function() {
            if (this.value != '') {
                $('#row3').css('display', 'block');
                //Get Data
                $.ajax({
                    url: "<?php echo base_url() ?>pemakaian/searchBookTitle",
                    type: "POST",
                    data: "id=" + this.value,
                    cache: false,
                    success: function(data) {
                        $("#tbJudul2").val(data);
                    }
                })
            }
            if (this.value == '') {
                $('#tbJudul2').val('');

                $('#row3').css('display', 'none');
                $('#slcBookCode3').prop('selectedIndex', 0);
                $('#tbJudul3').val('');
            }
        })
        //Buku 3
        $("#slcBookCode3").change(function() {
            if (this.value != '') {
                //Get Data
                $.ajax({
                    url: "<?php echo base_url() ?>pemakaian/searchBookTitle",
                    type: "POST",
                    data: "id=" + this.value,
                    cache: false,
                    success: function(data) {
                        $("#tbJudul3").val(data);
                    }
                })
            }

            if (this.value == '') {
                $('#tbJudul3').val('');
            }
        })
    })
</script>

<div class="">
    <div class="page-title" style="padding: 8px">
        <div class="title_left">
            <h1><i class="fa fa-arrow-up"></i> Pemakaian</h1>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Masukkan data pemakaian</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <!-- Notif -->
                    <?php $announce = $this->session->userdata('announce') ?>
                    <?php if (!empty($announce)) : ?>
                        <?php if ($announce == 'Berhasil menyimpan data') : ?>
                            <div class="alert alert-success fade in">
                                <?php echo $announce; ?>
                            </div>
                        <?php else : ?>
                            <div class="alert alert-danger">
                                <?php echo $announce; ?>
                            </div>
                        <?php endif; ?>
                    <?php endif; ?>
                    <form method="post" action="<?php echo base_url(); ?>pemakaian/submit" role="form" enctype="multipart/form-data">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Kode pemakaian</label>
                                        <input type="text" name="tbBrwCode" class="form-control" value="<?php echo $kode ?>" readonly="readonly">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>ID Anggota</label>
                                        <select class="form-control" id="slcAgta" name="slcAgta">
                                            <option value="">Pilih ID Anggota</option>
                                            <?php foreach ($anggota as $agt) : ?>
                                                <option><?php echo $agt->ID_ANGGOTA ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Tanggal Pemakaian</label>
                                                <?php
                                                $plus = date('Y-m-d', strtotime("+7 day", strtotime(date('Y-m-d'))));
                                                ?>
                                                <input name="tbDateStart" class="form-control" value="<?php echo date("Y-m-d"); ?>" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Nama Peminjam</label>
                                        <input type="text" name="tbNama" id="tbNama" class="form-control" placeholder="Pilih Kolom ID Anggota" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Nama Petugas</label>
                                        <input readonly="readonly" name="tbPetugas" class="form-control" value="<?php echo $petugas ?>">
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Kode PC</label>
                                        <select class="form-control" name="slcBookCode1" id="slcBookCode1">
                                            <option value="">Pilih Kode PC</option>
                                            <?php foreach ($pc as $kode) : ?>
                                                <option><?php echo $kode->ID_PC ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Spek PC</label>
                                        <input type="text" name="tbJudul" id="tbJudul1" class="form-control" placeholder="Spek PC" readonly="readonly">
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-md-12">
                                    <input type="submit" name="submit" class="btn btn-primary" value="Simpan">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>