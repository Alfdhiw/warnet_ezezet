<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Transaksi_model extends CI_Model
{

	public function getTotal()
	{
		return $this->db->count_all('pemakaian');
	}

	public function getPemakaian()
	{
		$this->db
			->join('anggota', 'anggota.ID_ANGGOTA = pemakaian.ID_ANGGOTA', 'left')
			->join('admin', 'admin.ID_ADMIN = pemakaian.ID_ADMIN', 'left')
			->where('pemakaian.STATS', 'Belum Kembali')
			->order_by('pemakaian.ID_PINJAM', 'ASC');
		return $this->db->get('pemakaian')->result();
	}

	public function getPengembalian()
	{
		$this->db
			->join('anggota', 'anggota.ID_ANGGOTA = pemakaian.ID_ANGGOTA', 'left')
			->join('admin', 'admin.ID_ADMIN = pemakaian.ID_ADMIN', 'left')
			->where('pemakaian.STATS', 'Sudah Kembali')
			->order_by('pemakaian.ID_PINJAM', 'ASC');
		return $this->db->get('pemakaian')->result();
	}
}

/* End of file Transaksi_model.php */
/* Location: ./application/models/Transaksi_model.php */