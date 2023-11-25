package com.project.hospital.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.hospital.model.Usuario;
import com.project.hospital.repository.IUsuarioRepository;

import jakarta.transaction.Transactional;

@Service
@Transactional
public class UsuarioService {

	@Autowired
	private IUsuarioRepository repository;

	public Usuario save(Usuario usuario) {
		return repository.save(usuario);
	}

	public Usuario find(int id) {
		Optional<Usuario> usuario = repository.findById(id);
		return !usuario.isEmpty() ? usuario.get() : null;
	}

	public boolean delete(int id) {
		Usuario usuario = find(id);
		if (usuario != null) {
			repository.delete(usuario);
			return true;
		}
		return false;
	}

	public Usuario login(String username, String password) {
		if (password.trim().isEmpty()) {
			return null;
		}
		Usuario user = repository.findByUsername(username);
		if (user != null && user.getPassword().equals(password)) {
			return user;
		}
		return null;
	}

	public List<Usuario> list() {
		return repository.findAll();
	}

	public Usuario createDefault() {
		if (!list().isEmpty()) {
			return null;
		}
		Usuario u = new Usuario();
		u.setUsername("admin");
		u.setPassword("admin");
		u.setNombres("Default");
		u.setApellidos("Default");
		u.setRol("Admin");
		return save(u);
	}
}
