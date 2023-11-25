package com.project.hospital.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.hospital.model.Especialidad;

public interface IEspecialidadRepository extends JpaRepository<Especialidad, Integer> {

}
