package com.project.hospital.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.hospital.model.Cita;
import com.project.hospital.repository.ICitaRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class CitaService {

	@Autowired
	private ICitaRepository repository;

	public Cita save(Cita cita) {
		return repository.save(cita);
	}

	public List<Cita> listByUsuario(long usuario_id) {
		return repository.listByUsuario(usuario_id);
	}

	public List<Cita> list(Date fecha_inicio, Date fecha_fin) {
		if (fecha_inicio != null && fecha_inicio != null) {
			return repository.listByDateOrdered(fecha_inicio, fecha_fin);
		}
		return repository.listOrdered();
	}
	
}
