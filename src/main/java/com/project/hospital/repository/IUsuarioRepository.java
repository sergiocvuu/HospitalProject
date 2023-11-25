package com.project.hospital.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.hospital.model.Usuario;

public interface IUsuarioRepository extends JpaRepository<Usuario, Integer> {
	public Usuario findByUsername(String username);
}
