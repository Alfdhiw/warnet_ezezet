<div class="row">
    <div class="alert alert-success text-center">
        <p style="font-size:17px"><b>Kode Pemakaian :</b> <?php echo $detail->ID_PINJAM ?></p>
    </div>
</div>
<div class="row text-center">
    <div class="col-md-4 col-xs-4">
        <label>Nama Pemakai</label>
        <p><?php echo $detail->FULL_NAME ?></p>
    </div>
    <div class="col-md-4 col-xs-4">
        <label>Tanggal Pemakaian</label>
        <p><?php $tgl = date_create($detail->TGL_PINJAM);
            echo date_format($tgl, "D, d M Y"); ?></p>
    </div>
    <div class="col-md-4 col-xs-4">
        <label>Nama Petugas</label>
        <p><?php echo $detail->FULLNAME ?></p>
    </div>
</div>
<div class="row">
    <hr>
    <h4 class="text-center">Daftar PC. Dipakai(<?php echo $status . '/' . $count ?>)</h4>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>No</th>
                <th>Spek Pc</th>
                <th>Bayar</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <?php $no = 1; ?>
            <?php foreach ($pc as $bk) : ?>
                <tr>
                    <th scope="row"><?php echo $no ?></th>
                    <td><?php echo $bk->TITLE ?></td>
                    <td>
                        <?php
                        $dl = strtotime("+7 day", strtotime($detail->TGL_PINJAM));
                        $now = time();
                        $bayar = 0;
                        if ($bk->STATUS == 'Sudah Kembali') {
                            echo 'Sudah kembali :';
                        } else {
                            if (strtotime(date("Y-m-d")) > $dl) {
                                $diff = $now - $dl;
                                $bayar = floor($diff / 1000000) * 500;
                                echo 'Bayar Rp.' . $bayar;
                            } else if (strtotime(date("Y-m-d")) < $dl) {
                                $diff = $dl - $now;
                                echo (floor($diff / 1000000) + 1) . ' Jam lagi';
                            } else {
                                echo 'Jam terakhir';
                            }
                        }
                        ?>
                    </td>
                    <td>
                        <?php if ($bk->STATUS == 'Belum Kembali') : ?>
                            <!-- BUTTON KEMBALI -->
                            <a href="<?php echo base_url() ?>pengembalian/kembali?id=<?php echo $bk->ID_DIPINJAM ?>&pnj=<?php echo $detail->ID_PINJAM ?>&bayar=<?php echo $bayar ?>&status=<?php echo $status ?>&count=<?php echo $count ?>&book=<?php echo $bk->ID_PC ?>" class="btn btn-success btn-xs" id="<?php echo $bk->ID_DIPINJAM ?>"><i class="fa fa-arrow-right"></i> Sudah Kembali</a>
                        <?php else : ?>
                            <?php $tg = date_create($bk->TGL_KEMBALI);
                            echo date_format($tg, "d M Y"); ?>
                        <?php endif; ?>
                    </td>
                </tr>
                <?php $no++; ?>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>