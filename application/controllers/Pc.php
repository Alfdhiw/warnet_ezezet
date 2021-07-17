<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Pc extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Pc_model');
		$this->load->model('Petugas_model');
		if ($this->session->userdata('logged_in') == false) {
			redirect('welcome');
		}
	}

	public function index()
	{
		$data['title'] = 'Pc';
		$data['primary_view'] = 'pc/pc_view';
		$data['total'] = $this->Pc_model->getCount();
		$data['list'] = $this->Pc_model->getList();
		$this->load->view('template_view', $data);
	}

	public function add()
	{
		$data['title'] = 'Tambah Pc';
		$data['primary_view'] = 'pc/add_pc_view';
		$this->load->view('template_view', $data);
	}

	public function submit()
	{
		if ($this->input->post('submit')) {
			$this->form_validation->set_rules('judul', 'Judul Buku', 'trim|required');
			$this->form_validation->set_rules('penerbit', 'Penerbit', 'trim|required');
			$this->form_validation->set_rules('tahun', 'Tahun', 'trim|required|numeric');
			$this->form_validation->set_rules('jumlah', 'Jumlah', 'trim|required|numeric');

			if ($this->form_validation->run() == true) {
				//GET : Petugas ID
				$username = $this->session->userdata('username');
				$id_petugas = $this->Petugas_model->getID($username);

				if ($this->Pc_model->insert($id_petugas) == true) {
					$this->session->set_flashdata('announce', 'Berhasil menyimpan data');
					redirect('pc/add');
				} else {
					$this->session->set_flashdata('announce', 'Gagal menyimpan data');
					redirect('pc/add');
				}
			} else {
				$this->session->set_flashdata('announce', validation_errors());
				redirect('pc/add');
			}
		}
	}

	public function submits()
	{
		if ($this->input->post('submit')) {
			$this->form_validation->set_rules('judul', 'Judul Buku', 'trim|required');
			$this->form_validation->set_rules('penerbit', 'Penerbit', 'trim|required');
			$this->form_validation->set_rules('tahun', 'Tahun', 'trim|required|numeric');
			$this->form_validation->set_rules('jumlah', 'Jumlah', 'trim|required|numeric');

			if ($this->form_validation->run() == true) {
				if ($this->Pc_model->update($this->input->post('id')) == true) {
					$this->session->set_flashdata('announce', 'Berhasil menyimpan data');
					redirect('pc/edit?idtf=' . $this->input->post('id'));
				} else {
					$this->session->set_flashdata('announce', 'Gagal menyimpan data');
					redirect('pc/edit?idtf=' . $this->input->post('id'));
				}
			} else {
				$this->session->set_flashdata('announce', validation_errors());
				redirect('pc/edit?idtf=' . $this->input->post('id'));
			}
		}
	}

	public function edit()
	{
		$id = $this->input->get('idtf');
		//CHECK : Data Availability
		if ($this->Pc_model->checkAvailability($id) == true) {
			$data['primary_view'] = 'pc/edit_pc_view';
		} else {
			$data['primary_view'] = '404_view';
		}
		$data['title'] = 'Edit Pc';
		$data['detail'] = $this->Pc_model->getDetail($id);
		$this->load->view('template_view', $data);
	}

	public function delete()
	{
		$id = $this->input->get('rcgn');
		if ($this->Pc_model->delete($id) == true) {
			$this->session->set_flashdata('announce', 'Berhasil menghapus data');
			redirect('pc');
		} else {
			$this->session->set_flashdata('announce', 'Gagal menghapus data');
			redirect('pc');
		}
	}
}

/* End of file Buku.php */
/* Location: ./application/controllers/Buku.php */