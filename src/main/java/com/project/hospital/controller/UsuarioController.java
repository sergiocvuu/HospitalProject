package com.project.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.hospital.model.Usuario;
import com.project.hospital.service.UsuarioService;
import com.project.hospital.utils.Utils;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsuarioController {

	@Autowired
	private UsuarioService service;

	@RequestMapping("/")
	public String Home(HttpServletRequest request) {
		Usuario admin = service.createDefault();
		if (admin != null) {
			request.setAttribute("adminDefault",
					"Se ha creado el administrador por defecto<br>Username: admin<br>Password: admin");
		}
		return "index";
	}

	@RequestMapping("/register")
	public String register(HttpServletRequest request) {
		return "auth/register";
	}

	@PostMapping("/register")
	public String register(@ModelAttribute Usuario user, BindingResult bindingResult, HttpServletRequest request) {
		try {
			user.setRol("Usuario");
			if (service.save(user) != null) {
				request.setAttribute("success", "Usuario registrado");
			} else {
				request.setAttribute("error", "No se pudo registrar el usuario");
			}
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}

		return "auth/register";
	}

	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		return "auth/login";
	}

	@PostMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, HttpServletRequest request) {
		try {
			Usuario user = service.login(username, password);
			if (user != null) {
				request.getSession().setAttribute("user", user);
				if (Utils.isAdmin(user)) {
					return "admin/index";
				} else if (Utils.isUser(user)) {
					return "cliente/index";
				}
				request.setAttribute("error", "Rol no asignado");
			} else {
				request.getSession().setAttribute("user", user);
				request.setAttribute("error", "Credenciales incorrectas");
			}
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}

		return "auth/login";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		return "auth/login";
	}

	@RequestMapping("/add-usuario")
	public String addUsuario(HttpServletRequest request) {
		return "admin/usuario/add";
	}

	@PostMapping("/add-usuario")
	public String addUsuario(@ModelAttribute Usuario usuario, BindingResult bindingResult, HttpServletRequest request) {
		try {
			if (service.save(usuario) != null) {
				request.setAttribute("success", "Usuario registrado");
			} else {
				request.setAttribute("error", "No se pudo registrar la usuario");
			}
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}

		return "admin/usuario/add";
	}

	@RequestMapping("/edit-usuario")
	public String editUsuario(@RequestParam int id, HttpServletRequest request) {
		request.setAttribute("usuario", service.find(id));
		return "admin/usuario/edit";
	}

	@PostMapping("/edit-usuario")
	public String editUsuario(@ModelAttribute Usuario usuario, BindingResult bindingResult,
			HttpServletRequest request) {
		try {
			if (service.save(usuario) != null) {
				request.setAttribute("success", "Usuario actualizado");
			} else {
				request.setAttribute("error", "No se pudo actualizar la usuario");
			}
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}

		return "admin/usuario/edit";
	}

	@RequestMapping("/delete-usuario")
	public String deleteUsuario(@RequestParam int id, HttpServletRequest request) {
		try {
			if (service.delete(id)) {
				request.setAttribute("success", "Usuario eliminada");
			} else {
				request.setAttribute("error", "No se pudo eliminar la usuario");
			}
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
		}

		request.setAttribute("usuarios", service.list());
		return "admin/usuario/list";
	}

	@RequestMapping("/usuarios")
	public String listUsuarios(HttpServletRequest request) {
		request.setAttribute("usuarios", service.list());
		return "admin/usuario/list";
	}

}
