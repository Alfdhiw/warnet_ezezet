<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pengembalian_model extends CI_Model
{

	public function getList()
	{
		$this->db
			->join('anggota', 'anggota.ID_ANGGOTA = pemakaian.ID_ANGGOTA', 'left')
			->join('admin', 'admin.ID_ADMIN = pemakaian.ID_ADMIN', 'left')
			->where('pemakaian.STATS', 'Belum Kembali')
			->order_by('pemakaian.ID_PINJAM', 'ASC');
		return $this->db->get('pemakaian')->result();
	}

	public function getCount()
	{
		return $this->db->count_all('detail_pinjam');
	}

	public function getDetail($id)
	{
		$this->db
			->join('pemakaian', 'pemakaian.ID_PINJAM = detail_pinjam.ID_PINJAM', 'left')
			->join('pc', 'pc.ID_PC = detail_pinjam.ID_PC', 'left')
			->join('anggota', 'anggota.ID_ANGGOTA = pemakaian.ID_ANGGOTA', 'left')
			->join('admin', 'admin.ID_ADMIN = pemakaian.ID_ADMIN', 'left')
			->where('detail_pinjam.ID_PINJAM', $id);
		return $this->db->get('detail_pinjam')->row();

		//return $this->db->where('ID_PINJAM', $id)->get('detail_pinjam')->row();
	}

	public function getBook($id)
	{
		return $this->db->where('detail_pinjam.ID_PINJAM', $id)
			->join('pc', 'pc.ID_PC = detail_pinjam.ID_PC', 'left')
			->order_by('detail_pinjam.ID_DIPINJAM', 'asc')
			->get('detail_pinjam')
			->result();
	}

	public function getPnjCnt($id)
	{
		return $this->db->where('ID_PINJAM', $id)->from('detail_pinjam')->count_all_results();
	}

	public function getPnjStt($id)
	{
		return $this->db->where(array('ID_PINJAM' => $id, 'STATUS' => 'Sudah Kembali'))
			->from('detail_pinjam')->count_all_results();
	}

	public function kembali($id_det, $id_pnj, $bayar, $complete, $id_pc)
	{
		$kembali = array(
			'TGL_KEMBALI'	=> date("Y-m-d"),
			'BAYAR'			=> $bayar,
			'STATUS'		=> 'Sudah Kembali'
		);
		$this->db->where('ID_DIPINJAM', $id_det)->update('detail_pinjam', $kembali);

		//Menambah stok buku
		$qty = $this->db->where('ID_PC', $id_pc)
			->get('pc')
			->row('QTY');
		$plus = (int) $qty + 1;
		$this->db->set('QTY', $plus)->where('ID_PC', $id_pc)->update('pc');

		//Mengurangi kolom di pinjam
		$keluar = $this->db->where('ID_PC', $id_pc)
			->get('pc')
			->row('KELUAR');
		$min = (int) $keluar - 1;
		$this->db->set('KELUAR', $min)->where('ID_PC', $id_pc)->update('pc');

		if ($complete == true) {
			$this->db->set('STATS', 'Sudah Kembali')
				->where('ID_PINJAM', $id_pnj)
				->update('pemakaian');
		}

		$this->db->affected_rows() > 0 ? $y = true : $y = false;
		return $y;
	}
}

/* End of file Pengembalian_model.php */
/* Location: ./application/models/Pengembalian_model.php */