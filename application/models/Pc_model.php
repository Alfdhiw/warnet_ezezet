 <?php
	defined('BASEPATH') or exit('No direct script access allowed');

	class Pc_model extends CI_Model
	{

		public function insert($id_petugas)
		{
			$data = array(
				'ID_PC'		=> $this->generateID(),
				'ID_ADMIN'		=> $id_petugas,
				'TITLE'			=> $this->input->post('judul'),
				'PUBLISHER'		=> $this->input->post('penerbit'),
				'YEAR'			=> $this->input->post('tahun'),
				'QTY'			=> $this->input->post('jumlah'),
				'KELUAR'		=> 0
			);

			$this->db->insert('pc', $data);
			if ($this->db->affected_rows() > 0) {
				return true;
			} else {
				return false;
			}
		}

		public function update($id)
		{
			$data = array(
				'TITLE'			=> $this->input->post('judul'),
				'PUBLISHER'		=> $this->input->post('penerbit'),
				'YEAR'			=> $this->input->post('tahun'),
				'QTY'			=> $this->input->post('jumlah')
			);

			$this->db->where('ID_PC', $id)->update('pc', $data);
			if ($this->db->affected_rows() > 0) {
				return true;
			} else {
				return false;
			}
		}

		public function getCount()
		{
			return $this->db->count_all('pc');
		}

		public function getList()
		{
			return $query = $this->db->order_by('ID_PC', 'ASC')->get('pc')->result();
		}

		public function generateID()
		{
			$query = $this->db->order_by('ID_PC', 'DESC')->limit(1)->get('pc')->row('ID_PC');
			$lastNo = substr($query, 3);
			$next = $lastNo + 1;
			$kd = 'BKO';
			return $kd . sprintf('%03s', $next);
		}

		public function getDetail($id)
		{
			return $this->db->where('ID_PC', $id)->get('pc')->row();
		}

		public function delete($id)
		{
			$this->db->where('ID_PC', $id)->delete('pc');
			if ($this->db->affected_rows() > 0) {
				return true;
			} else {
				return false;
			}
		}

		public function checkAvailability($id)
		{
			$query = $this->db->where('ID_PC', $id)->get('pc');
			if ($query->num_rows() > 0) {
				return true;
			} else {
				return false;
			}
		}
	}
