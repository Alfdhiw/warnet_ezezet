<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pemakaian extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Pemakaian_model');
		if ($this->session->userdata('logged_in') == false) {
			redirect('welcome');
		}
	}

	public function index()
	{
		$data = array(
			'title'			=> 'Pemakaian',
			'kode'			=> $this->Pemakaian_model->generateID(),
			'petugas'		=> $this->Pemakaian_model->getPetugas(),
			'anggota'		=> $this->Pemakaian_model->getAgtList(),
			'pc'			=> $this->Pemakaian_model->getBkuList(),
			'primary_view'	=> 'transaksi/pemakaian_view'
		);
		$this->load->view('template_view', $data);
	}

	public function searchAgtName()
	{
		$kode = $this->input->post('id');
		$anggota = $this->Pemakaian_model->cariAnggota($kode);
		if ($anggota->num_rows() > 0) {
			$agt = $anggota->row_array();
			echo $agt['FULL_NAME'];
		}
	}

	public function searchBookTitle()
	{
		$kode = $this->input->post('id');
		$judul = $this->Pemakaian_model->cariJudul($kode);
		if ($judul->num_rows() > 0) {
			$jdl = $judul->row_array();
			echo $jdl['TITLE'];
		}
	}


	public function submit()
	{
		if ($this->input->post('submit')) {
			$this->form_validation->set_rules('tbNama', 'Kode anggota', 'trim|required');
			$this->form_validation->set_rules('slcBookCode1', 'Kode pc', 'trim|required');

			if ($this->form_validation->run() == true) {
				if ($this->Pemakaian_model->insert() == true) {
					$this->session->set_flashdata('announce', 'Berhasil menyimpan data');
					redirect('pemakaian');
				} else {
					$this->session->set_flashdata('announce', 'Gagal menyimpan data');
					redirect('pemakaian');
				}
			} else {
				$this->session->set_flashdata('announce', validation_errors());
				redirect('pemakaian');
			}
		}
	}
}

/* End of file Peminjaman.php */
/* Location: ./application/controllers/Peminjaman.php */