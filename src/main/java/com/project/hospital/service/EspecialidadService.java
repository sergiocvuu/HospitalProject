package com.project.hospital.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.hospital.model.Especialidad;
import com.project.hospital.repository.IEspecialidadRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class EspecialidadService {

	@Autowired
	private IEspecialidadRepository repository;

	public List<Especialidad> list() {
		return repository.findAll();
	}

	public Especialidad save(Especialidad especialidad) {
		return repository.save(especialidad);
	}

	public Especialidad find(int id) {
		Optional<Especialidad> especialidad = repository.findById(id);
		return !especialidad.isEmpty() ? especialidad.get() : null;
	}

	public boolean delete(int id) {
		Especialidad especialidad = find(id);
		if (especialidad != null) {
			repository.delete(especialidad);
			return true;
		}
		return false;
	}
}
